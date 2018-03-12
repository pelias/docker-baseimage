# base image
FROM ubuntu:latest

# configure env
ENV DEBIAN_FRONTEND 'noninteractive'

# update apt, install core apt dependencies and delete the apt-cache
# note: this is done in one command in order to keep down the size of intermediate containers
ADD packages.sh .
RUN bash packages.sh

# configure locale
RUN locale-gen 'en_US.UTF-8'
ENV LANG 'en_US.UTF-8'
ENV LANGUAGE 'en_US:en'
ENV LC_ALL 'en_US.UTF-8'

# configure directories
RUN mkdir -p '/code/pelias'

# configure volumes
VOLUME "/data"

# configure git
RUN git config --global 'user.email' 'pelias.team@gmail.com'
RUN git config --global 'user.name' 'Pelias Docker'

# install nodejs
ENV NODE_VERSION='8.11.3'
RUN git clone 'https://github.com/isaacs/nave.git' /code/nave && /code/nave/nave.sh 'usemain' "${NODE_VERSION}" && rm -rf /code/nave

# add global install dir to $NODE_PATH
ENV NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"

# get ready for pelias config with an empty file
ENV PELIAS_CONFIG '/code/pelias.json'
RUN echo '{}' > /code/pelias.json
