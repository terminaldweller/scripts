#!/bin/sh
set -e
set -x

GIT_REPO_DIR=/etc/gitrepos
ORIGIN_HTTPS=https://github.com/terminaldweller
ORIGIN_SSH=git@github.com:terminaldweller
REPOS="cgrep \
  mutator \
  delf \
  dwasm \
  colo \
  blog \
  devourer \
  hived \
  mdrtl \
  simplex \
  scripts \
  vagrantboxes \
  dockerimages \
  st \
  dmenu \
  tabbed \
  dwm \
  w3m \
  leetcode \
  irssi-scripts \
  jupyter-notebook-docker-compose \
  seer \
  devi-githooks \
  kaminokumo \
  grpc \
  faultreiber \
  luatablegen \
  cfe-extra"

bootstrap() {
  for REPO in ${REPOS}; do
    (cd "${GIT_REPO_DIR}" && git clone --bare "${ORIGIN_HTTPS}/${REPO}")
  done
}

update_repos() {
  for REPO in ${REPOS}; do
    (cd "${GIT_REPO_DIR}/${REPO}".git && git fetch || true)
  done
}

on_startup() {
  dir_list=$(ls -A "$1")
  if [ -z "$dir_list" ]; then
    bootstrap
  else
    update_repos
  fi
}

if [ "$1" = "--startup" ]; then
  on_startup "$@"
elif [ "$1" = "--update" ]; then
  update_repos
elif [ "$1" = "--bootstrap" ]; then
  bootstrap
fi
