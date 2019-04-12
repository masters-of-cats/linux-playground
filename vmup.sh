#!/bin/bash
set -euo pipefail

log() {
  echo
  echo "----------------------------------------------------------------------"
  echo "$1"
  echo "----------------------------------------------------------------------"
  echo
}

log "Oh boy, here I go installin' again!"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

(
cd "$DIR"
vagrant up --provision --provider virtualbox
)

log "Don't forget to read the post install steps for your OS in README.md."
