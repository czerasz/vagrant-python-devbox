#!/bin/bash

local_user=vagrant

apt-get install -y python \
                   python-dev;

# Dependencies for image processing with Pillow (drop-in replacement for PIL)
# supporting: jpeg, tiff, png, freetype, littlecms
# (pip install pillow to get pillow itself, it is not in requirements.txt)
apt-get install -y libjpeg-dev \
                   libtiff-dev \
                   zlib1g-dev \
                   libfreetype6-dev \
                   liblcms2-dev;

# Install pip as a virtualenv dependency
if ! command -v pip; then
    apt-get install -y python-pip;
fi

# Install virtualenv & virtualenvwrapper
# Resource: http://roundhere.net/journal/virtualenv-ubuntu-12-10/
if [[ ! -f /usr/local/bin/virtualenv ]]; then
    pip install virtualenv virtualenvwrapper

    if [[ ! -d /home/$local_user/.virtualenvs ]]; then
        # Create a dir to store your virtualenvs
        su - $local_user -c 'mkdir -p ~/.virtualenvs'
    fi

    if grep -q 'source /usr/local/bin/virtualenvwrapper.sh' /home/$local_user/.bashrc; then
        su - $local_user -c echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc
    fi
fi