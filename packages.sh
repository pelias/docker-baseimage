packages=(
"locales" # required for language support
"apt-utils"
"iputils-ping"
"curl"
"wget"
"git-core"
"autoconf"
"automake"
"libtool"
"pkg-config"
"python" # required for node-gyp, in particular `integer` required by `better-sqlite3`
"software-properties-common" # required to add valhalla repo
)

apt-get update && \
  apt-get install -y ${packages[@]} && \
  rm -rf /var/lib/apt/lists/*
