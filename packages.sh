packages=(
"locales" # required for language support
"ca-certificates" # required for nave to access https endpoints
"apt-utils"
"iputils-ping"
"curl"
"wget"
"git"
"bzip2"
"lbzip2"
"unzip"
"libsqlite3-mod-spatialite" # required for spatialite support in sqlite3
)

apt-get update && \
  apt-get install -y ${packages[@]} && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
