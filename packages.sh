packages=(
"locales" # required for language support
"iputils-ping"
"curl"
"wget"
"git-core"
"autoconf"
"automake"
"libtool"
"pkg-config"
"python" # required for node-gyp, in particular `integer` required by `better-sqlite3`
)

apt-get update && \
  apt-get install -y ${packages[@]} && \
  rm -rf /var/lib/apt/lists/*
