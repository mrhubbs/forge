#!/bin/sh

export TEST_SITE=/home/tester/example-site
export FORGE_VERSION=$(cat /home/tester/forge-version)
export PATH="${PATH}:/home/tester/.bin"

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# switch to the tests directory
cd $(dirname $0)

# run tests
./versioning.sh
