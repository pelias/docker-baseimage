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
"pigz"
"zstd"
"time"
"gawk"
"libsqlite3-mod-spatialite" # required for spatialite support in sqlite3
"libatomic1" # required by node.js 26
)

apt-get update && \
  apt-get install -y ${packages[@]} && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
