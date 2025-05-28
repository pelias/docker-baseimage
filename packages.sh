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
)

apt-get update && \
  apt-get install -y ${packages[@]} && \
  rm -rf /var/lib/apt/lists/*
