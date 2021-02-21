# -*- coding: utf-8 -*-
'''
Module to handle the Satis configuration json file
'''

from __future__ import absolute_import

import logging
import os
import subprocess
import json
# import salt

log = logging.getLogger(__name__)

# Verify proper role
SATIS = os.access('/usr/bin/compose', os.F_OK)


def __virtual__():
    '''
    Only load this module if compose is installed.
    '''
    if SATIS:
        return 'satis'
    return False


def add_package(name, version='*', rebuild=False):
    '''
    Add a package to the "require" section of the config

    name    = The name of the package to be added
    version = The required version for the package
              - use '*' to specify all versions are allowed
              - make sure to escape or quote the *, as above,
                to avoid shell expansion collision

    Example:

        salt '*satis*' satis.add_package aws/aws-sdk-php "3.56.0"
    '''
    # Load configuration file and set vars
    configfile = _load_config()
    result = {}
    newpkg = {str(name): str(version)}

    # Make the config change
    configfile['require'].update(newpkg)
    result['list'] = configfile['require']

    # Write out the change to the file
    result['file'] = _write_config(configfile)
    log.info("Adding %s v%s to package list.", str(name), str(version))

    # Run the rebuild command to apply the changes
    if rebuild:
        result['rebuild'] = build(pkgs=name)
    else:
        result['rebuild'] = 'Rebuild deferred. Please run a satis.build to rebuild packages and repositories.'

    # Return everything we did
    return result


def rm_package(name):
    '''
    Remove a package from the "require" section of the config

    name = The name of the package to be removed

    Example:

        salt '*satis*' satis.rm_package aws/aws-sdk-php
    '''
    configfile = _load_config()
    result = {}

    # Make the config change
    result['removed'] = {name: configfile['require'].pop(name)}

    # Write out the change to the file
    result['file'] = _write_config(configfile)
    log.info("Removing %s from package list.", str(name))

    # Run the rebuild command to apply the changes
    # result['rebuild'] = build()
    result['rebuild'] = 'Rebuild deferred.  Please run a satis.build to rebuild packages and repositories.'

    # Return everything we did
    return result


def list_packages():
    '''
    List the packages in the required section.

    Example:

      salt '*satis*' satis.list_packages
    '''
    configfile = _load_config()
    return configfile['require']


def build(pkgs=None, repo=None):
    '''
    Rebuild the packages in the repository

    pkgs = Comma separated list of packages to build
    repo = URL of individual repo to build

    Only specify one or the other, not both.
    Specifying no arguments will build all packages and repos

    Examples:

        salt '*satis*' satis.build
        salt '*satis*' satis.build pkgs=aws/aws-sdk-php,google/apiclient
        salt '*satis*' satis.build repo='https://packagist.org'
    '''
    # Determine if we need to specify the specific repository option

    ## Add default auth if file not found to allow build to work
    if not os.path.isfile('/var/www/html/auth.json'):
        _default_auth_file()

    try:
        cmd = [
            'php', './satis/bin/satis', 'build',
            './satis-packages.conf', './repository'
        ]
        if pkgs and repo:
            return 'Can only specify packages or repo, not both.'
        elif pkgs:
            cmd.extend(pkgs.split(','))
        elif repo:
            cmd[3:3] = ['--repository-url', repo]

        process = subprocess.check_output(
            cmd,
            env={"COMPOSER_HOME": "/var/www/html/"},
            cwd="/var/www/html/",
            stderr=subprocess.STDOUT,
            universal_newlines=True
            )
        log.info("Composer package build successful.")
        return process
    except subprocess.CalledProcessError as error:
        log.debug("Error: %s", error.output)
        return error.output


def add_repo(repo_type, url, auth=False, rebuild=False):
    '''
    Add a repository to the Satis configuration file

    repo_type =  The repo_type of repository. Can be one of the following:
              composer - This is a local file named packages.json
              vcs      - This is a version control system repo, like git, svn, fossil, or hg
              pear     - This is a PEAR channel repo, on a per-package basis
              package  - This is a custom repo
    url       =  The url for the repository
    auth      = A boolean value to determine if the read-only release user should be set
                as the username for the repo. Defaults to False

    Example:

        salt '*satis*' satis.add_repo composer "https://packagist.org"
    '''
    # Load configuration file and set vars
    configfile = _load_config()
    result = {}
    newrepo = {'type': str(repo_type), 'url': str(url)}

    # Iterate through the list and make sure that the new repo does not already exist
    for i, val in enumerate(configfile['repositories']):
        if val == newrepo:
            return '{repo} already exists at index {idx}!'.format(repo=newrepo, idx=i)

    # Make the config change
    configfile['repositories'].append(newrepo)

    # Note the new repository list
    result['list'] = configfile['repositories']

    # Check for auth and, if true, run the internal function
    if auth:
        result['add_authentication'] = _add_auth(url)
    else:
        result['add_authentication'] = False

    # Write out the change to the file
    result['file'] = _write_config(configfile)
    log.info("Adding repository type %s, URL %s to repository list.", str(repo_type), str(url))

    # Run the rebuild command to apply the changes
    if rebuild:
        result['rebuild'] = build(repo=url)
    else:
        result['rebuild'] = 'Rebuild deferred. Please run a satis.build to rebuild packages and repositories.'

    # Return everything we did
    return result


def remove_repo(repo_type, url):
    '''
    Removes a repository from the list

    repo_type =  The repo_type of repository. Can be one of the following:
              composer - This is a local file named packages.json
              vcs      - This is a version control system repo, like git, svn, fossil, or hg
              pear     - This is a PEAR channel repo, on a per-package basis
              package  - This is a custom repo
    url  =  The url for the repository

    Example:

        salt '*satis*' satis.remove_repo composer "https://packagist.org"
    '''
    # Load configuration file and set vars
    configfile = _load_config()
    result = {}
    deadrepo = {'type': str(repo_type), 'url': str(url)}

    # Iterate through the list and make sure that the repo exists
    for i, val in enumerate(configfile['repositories']):
        if val == deadrepo:
            configfile['repositories'].remove(deadrepo)
            log.info("Removed repo %s of type %s at index %s", str(url), str(repo_type), str(i))

    # Note the new repository list
    result['list'] = configfile['repositories']

    # Remove any existing auth entry tied to the URL
    result['removed_authentication'] = _remove_auth(url)

    # Write out the change to the file
    result['file'] = _write_config(configfile)
    log.info("Removing repository type %s, URL %s from the repository list.", str(repo_type), str(url))

    # Run the rebuild command to apply the changes
    # result['rebuild'] = build()

    # Return everything we did
    return result


def list_repo():
    '''
    Lists all repositories

    Example:

        salt '*satis*' satis.list_repo
    '''
    # Load configuration file
    configfile = _load_config()
    result = {}

    # Note the repository list
    result['list'] = configfile['repositories']

    # Return the list
    return result


def _load_config():
    '''
    Load the config file from the expected path.
    This file path will be hardcoded, as it is handled by Salt.
    '''
    with open("/var/www/html/satis-packages.conf", "r") as conf:
        config = json.load(conf)
    return config


def _write_config(config):
    '''
    Write out the config file to the expected path
    This file path will be hardcoded, as it is handled by Salt.
    '''
    with open("/var/www/html/satis-packages.conf", "w") as writeout:
        json.dump(config, writeout, indent=2)
        return True
    return False


def _add_auth(url):
    '''
    Add authentication details for a repository, pulling the credentials
    from pillar values.
    '''
    # Get credentials from Salt Pillar
    try:
        user = __pillar__['satis']['auth']['username']
        secret = __pillar__['satis']['auth']['password']
    except KeyError:
        user = 'failed_to_fetch_auth'
        secret = '*****'

    urlsnip = url.split('/', 3)[2]
    authset = {urlsnip: {"username": user, "password": secret}}

    # load authentication file
    auth = _load_auth()

    # Add credentials to object
    auth["http-basic"].update(authset)

    # Write out authentication file
    fresult = _write_auth(auth)

    # Return repo url, user, and success status
    return "Authentication added for user {userstring} and repo {repourl}.\n{fileresult}".format(
        userstring=user,
        repourl=urlsnip,
        fileresult=fresult
        )


def _remove_auth(url):
    '''
    Remove authentication details for a repository.
    '''
    result = {}
    # Load authentication file
    auth = _load_auth()
    urlsnip = url.split('/', 3)[2]

    # Check if the URL exists in the auth file
    try:
        result['auth'] = auth["http-basic"].pop(urlsnip)

        # Mask password returned from the dict.pop()
        result['auth']['password'] = '*****'

        # Write out authentication file
        result['file_write'] = _write_auth(auth)

        # Return removed repo url, user, and success status
        return "Removed auth entry for {repo}:\nResult: {result}".format(repo=urlsnip, result=result)
    except KeyError:
        # Return that we didn't find the auth
        return "{repo} was not found in the auth.json file.".format(repo=url)

    # If we get here, assume something went wrong
    return False


def _default_auth_file():
    '''
    This internal function creates a basic, empty auth.json file
    '''
    auth_template = {
        "http-basic": {
            }
        }
    _write_auth(auth_template)
    return auth_template


def _load_auth():
    '''
    Load the authentication file into an object.
    '''
    # try to open the file into an object
    try:
        # Load authentication file
        with open("/var/www/html/auth.json", "r") as file_auth:
            auth = json.load(file_auth)

        return auth

    except (IOError, ValueError):
        return _default_auth_file()


def _write_auth(data):
    '''
    Write out the provided data to the authentication file.
    '''
    # Try to open the file for writing
    try:
        # Open authentication file for writing
        with open("/var/www/html/auth.json", "w") as writeout:
            json.dump(data, writeout, indent=2)
            return True
        return False

    except IOError:
        return IOError
