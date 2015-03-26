#!/bin/bash

# Update system
apt-get update --fix-missing

# Fix locales
# Resources:
# - http://askubuntu.com/questions/536875/error-in-installing-mongo-in-virtual-machine
# - https://help.ubuntu.com/community/Locale
# - http://jaredmarkell.com/docker-and-locales/
if locale -a | grep -q 'en_US.utf8'; then
    # All locales are available in /usr/share/i18n/locales

    cat <<'EOF' > /etc/default/locale
LANG="en_US.UTF-8"
LANGUAGE="en_US:en"
LC_ALL="en_US.UTF-8"
LC_ALL="C"
EOF

    locale-gen en_US.UTF-8
    dpkg-reconfigure locales

    export LANG=en_US.UTF-8
    export LANGUAGE=en_US:en
    export LC_ALL=en_US.UTF-8
fi

# Install basic packages
apt-get install -y build-essential
apt-get install -y vim git tree htop
