#!/bin/sh
#
# git_clone_or_update: clone a repo, or update it if it exists locally
#
# Given $1 a Git repostory, this with either clone
# or update depending if it exists or not locally.
#
git_clone_or_update() {
  URL=$1
  REPO=${URL##*/}   # foo.git
  REPO=${REPO%.git} # foo
  if [ ! -d "$REPO" ]; then
    git clone ${URL} 
  else
    (cd ${REPO} && git pull > /dev/null)
  fi
}
