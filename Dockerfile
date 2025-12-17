# base image
FROM ubuntu:24.04

# configure env
ENV DEBIAN_FRONTEND='noninteractive'
ENV NODE_PATH=''

# update apt, install core apt dependencies and delete the apt-cache
# note: this is done in one command in order to keep down the size of intermediate containers
ADD packages.sh .
RUN bash packages.sh

# configure locale
RUN locale-gen 'en_US.UTF-8'
ENV LANG='en_US.UTF-8'
ENV LANGUAGE='en_US:en'
ENV LC_ALL='en_US.UTF-8'

# maintainer information
LABEL maintainer="team@pelias.io"

# configure directories
RUN mkdir -p '/data' '/code/pelias'

# configure volumes
VOLUME "/data"

# configure git
RUN git config --global 'user.email' 'team@pelias.io'
RUN git config --global 'user.name' 'Pelias Docker'

# install nodejs
ENV NODE_VERSION='20.19.4'
RUN git clone 'https://github.com/isaacs/nave.git' /code/nave && \
    /code/nave/nave.sh 'usemain' "${NODE_VERSION}" && \
    rm -rf ~/.nave /code/nave && \
    npm i npm -g && \
    rm -rf /usr/local/lib/node_modules/npm/docs \
           /usr/local/lib/node_modules/npm/man \
           ~/.npm

# add global install dir to $NODE_PATH
ENV NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"

# get ready for pelias config with an empty file
ENV PELIAS_CONFIG='/code/pelias.json'
RUN echo '{}' > '/code/pelias.json'

# add a pelias user
RUN useradd -ms /bin/bash pelias

# ensure symlinks, pelias.json, and anything else are owned by pelias user
RUN chown pelias:pelias /data /code -R
