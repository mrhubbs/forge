FROM ubuntu:16.04
LABEL maintainer="William Sember" \
      description="Image for testing (end-to-end & unit) forge." \
      project="forge"

## all root stuff

# install dependencies
RUN apt-get update
RUN apt-get clean
RUN apt-get install -y curl

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs

RUN npm i -g semver

# add testing user
ARG TEST_USER=tester
ARG TEST_USER_HOME=/home/${TEST_USER}
RUN useradd --create-home --home-dir /home/${TEST_USER} --shell /bin/bash ${TEST_USER}

## all user stuff
USER ${TEST_USER}

WORKDIR ${TEST_USER_HOME}
# customize terminal
ADD colorize .
RUN cat colorize >> ${TEST_USER_HOME}/.bashrc
RUN rm colorize
# put user's .bin in the PATH
RUN echo "export PATH=\"\${PATH}:${TEST_USER_HOME}/.bin\"" >> ${TEST_USER_HOME}/.bashrc

# install example site
COPY --chown=tester example-site example-site/

# add tests
# do this towards the end as it'll probably change often
WORKDIR ${TEST_USER_HOME}
COPY --chown=tester tests tests/

# default in this directory
WORKDIR ${TEST_USER_HOME}
