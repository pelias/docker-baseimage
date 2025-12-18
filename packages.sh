packages=(
"locales" # required for language support
"apt-utils"
"iputils-ping"
"curl"
"wget"
"git-core"
"bzip2"
"lbzip2"
"unzip"
"pigz"
"zstd"
"time"
"gawk"
"libsqlite3-mod-spatialite" # required for spatialite support in sqlite3
)

apt-get update && \
  apt-get install -y ${packages[@]} && \
  rm -rf /var/lib/apt/lists/*
