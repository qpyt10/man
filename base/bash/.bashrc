#!/bin/bash
# 11/11/09
# 08/03/13 m
#
# add to ~/.bashrc
# bashrc_path=
# test -f $bashrc_path/.bashrc && . $bashrc_path/.bashrc

export HISTFILESIZE=3000      # bash history save 3000 commands
export HISTCONTROL=ignoredups # don't duplicate lines in history
# Append commands to the bash command history file (~/.bash_history)
# instead of overwriting it.
shopt -s histappend
# Append commands to the history every time a prompt is shown,
# instead of after closing the session.
PROMPT_COMMAND='history -a'

# User specific aliases and functions
_DEBUG=off


#### load LOCAL settings
#
# load local alias from HOME dir
test -f $HOME/.bash_alias && . $HOME/.bash_alias
#
# load local bin dir from HOME dir
test -d $HOME/bin && PATH=$PATH:$HOME/bin
#
#### end local settings


### setting path
settings_path=$bashrc_path/../..

### load bash environment
load_files="functions.sh .bash_alias .bash_prompt"
for this_file in $load_files
do
  test -f $bashrc_path/$this_file && . $bashrc_path/$this_file
  DEBUG loading file : $this_file
done

test -s $bashrc_path/.dircolors.rc && eval `dircolors -b $bashrc_path/.dircolors.rc`

### load host:
host_path=$settings_path/host
test -e $host_path && export PATH=$PATH:$host_path


export SVN_EDITOR=vim

#my_svn="svn+ssh://orlandin@matrix.caspur.it/home/orlandin/svn"
my_svn="svn+ssh://sorland2@login.plx.cineca.it/plx/userinternal/sorland2/svn/settings"


### load Desk environment:
Desk_path=$Setting_path/desk
test -e $Desk_path/google && export PATH=$PATH:$Desk_path/google

# if fortune exists: execute fortune
test `command -v fortune` && fortune
