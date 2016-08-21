#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
File: iygnohz.py
Author: iygnohz
Email: iygnohz@email.com
Github: https://github.com/iygnohz
Description: Use to install and upgrade dotfiles.
"""

import os
import click
import shutil
import requests
from datetime import datetime


settings = {
    'repo_url': "https://github.com/iygnohz/dotfiles",
    'install_path': "{0}/.iygnohz".format(os.environ['HOME']),
    'backup_path': "{0}/.iygnohz_pre".format(os.environ['HOME']),
    'home': os.environ['HOME'],
    'configs': [
        ".aliases",
        ".bash_profile",
        ".bash_prompt",
        ".bashrc",
        ".dircolors",
        ".exports",
        ".gitconfig",
        ".gitignore",
        ".ssh",
        ".tmux.conf",
        ".vimrc",
        ".zshrc",
    ],
}

s = settings


@click.command(cls=click.Group)
def cli():
    """Use to install and upgrade dotfiles."""


@cli.command()
def install():
    """Install iygnohz's dotfiles."""

    info("git clone https://github.com/iygnohz/dotfiles %(install_path)s" % (s))
    if os.path.exists(s['install_path']):
        warn("%(install_path)s is exist, remove it." % (s))
        shutil.rmtree(s['install_path'])
    sh("git clone https://github.com/iygnohz/dotfiles %(install_path)s" % (s))

    info("Create symbolic links.")
    configs = s['configs']
    for fname in configs:
        target = os.path.join(s['home'], fname)
        if os.path.exists(target):
            warn("%s is exist, remove it." % target)
            os.remove(target)
    for fname in configs:
        info('Create a symbolic link for %s' % fname)
        source = os.path.join(s['install_path'], fname)
        target = os.path.join(s['home'], fname)
        os.symlink(source, target)

    info("git clone https://github.com/robbyrussell/oh-my-zsh.git %(home)s/.oh-my-zsh" % (s))
    oh_my_zsh_install_path = '%(home)s/.oh-my-zsh' % (s)
    if os.path.exists(oh_my_zsh_install_path):
        warn("%s is exist, if something wrong, please remove it and rerun this command." % (oh_my_zsh_install_path))
    else:
        sh("git clone https://github.com/robbyrussell/oh-my-zsh.git %s" % (oh_my_zsh_install_path))
        r = requests.get("https://raw.githubusercontent.com/dracula/zsh/master/dracula.zsh-theme")
        zsh_theme = "%(home)s/.oh-my-zsh/themes/dracula.zsh-theme" % (s)
        with open(zsh_theme, "w") as fd:
            fd.write(r.content)

    info("git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim")
    sh("git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim")


def sh(cmd):
    os.system(cmd + " >/dev/null 2>&1")


def info(content):
    content = "INFO:    {0} {1}".format(now(), content)
    click.echo(click.style(content, fg="green"))


def warn(content):
    content = "WARNING: {0} {1}".format(now(), content)
    click.echo(click.style(content, fg="yellow"))


def error(content):
    content = "ERROR:   {0} {1}".format(now(), content)
    click.echo(click.style(content, fg="red"))


def now():
    now = datetime.now()
    return now.strftime('%Y-%m-%d %H:%M:%S')
