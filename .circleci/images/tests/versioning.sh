#!/bin/bash

# Philosophy: we're not trying to test *all* possible scenarios, since forge
# uses an external library to verify compatible versions. We're just trying to
# test the forge logic.

cd ${TEST_SITE}

function setversion() {
  cat forge.config.js.bac | sed "s/^  forgeVersion: .*$/  forgeVersion: \"$1\",/" > forge.config.js
}

function sayFail() {
  echo " -> $1";
  exit 1;
}

# before we begin, save our "master copy" of the config, as we'll be editing it
cp forge.config.js forge.config.js.bac

# check that -v/--version gives the version of forge from the package.json
TEST_VERSION=$(forge --version)
[ "${TEST_VERSION}" == "${FORGE_VERSION}" ] || { sayFail "--version gave incorrect version ${TEST_VERSION}, should have been ${FORGE_VERSION}"; }
TEST_VERSION=$(forge -v)
[ "${TEST_VERSION}" == "${FORGE_VERSION}" ] || { sayFail "-v gave incorrect version ${TEST_VERSION}, should have been ${FORGE_VERSION}"; }

# valid, matching config
forge build || { sayFail "wasn't okay with matching versions"; }

# re-write to require higher patch
setversion $(semver -i patch ${FORGE_VERSION})
# should fail
forge build && { sayFail "was okay with incompatible patch"; }

# re-write to require higher minor
setversion $(semver -i minor ${FORGE_VERSION})
# should fail
forge build && { sayFail "was okay with incompatible minor"; }

# re-write to require higher major
setversion $(semver -i major ${FORGE_VERSION})
# should fail
forge build && { sayFail "was okay with incompatible major"; }

# re-write to empty version
setversion $(semver -i major "")
# should fail
forge build && { sayFail "was okay with empty version"; }

# remove forge version entirely
cat forge.config.js.bac | sed "s/^.*  forgeVersion: .*$//" > forge.config.js
forge build && { sayFail "was okay no version"; }

exit 0;
