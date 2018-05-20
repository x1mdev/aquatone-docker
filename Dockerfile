FROM knjcode/rpi-node-armv7
WORKDIR /

# Prepare - skip upgrade for dev
RUN apt-get update
# RUN apt-get upgrade -y

# Install normal Packages needed
RUN apt-get install -y -u apt-utils unzip wget curl jruby nano screen htop openssl git ruby-full

# Install nodejs
# RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
# RUN apt-get install -y nodejs

# Install nodejs arm
RUN wget http://node-arm.herokuapp.com/node_latest_armhf.deb
RUN dpkg -i node_latest_armhf.deb

# Installing the packages needed to run Nightmare
RUN apt-get install -y \
  xvfb \
  x11-xkb-utils \
  xfonts-100dpi \
  xfonts-75dpi \
  xfonts-scalable \
  xfonts-cyrillic \
  x11-apps \
  clang \
  libdbus-1-dev \
  libgtk2.0-dev \
  libnotify-dev \
  libgnome-keyring-dev \
  libgconf2-dev \
  libasound2-dev \
  libcap-dev \
  libcups2-dev \
  libxtst-dev \
  libxss1 \
  libnss3-dev
#  gcc-multilib
#  g++-multilib
# need to find replacement for those 2

# Use aq domain.com to automated all options of aquatone.
RUN wget "https://gist.githubusercontent.com/random-robbie/beae1991e9ad139c6168c385d8a31f7d/raw/" -O /bin/aq
RUN chmod 777 /bin/aq

#install aquatone - not working yet
#RUN gem install aquatone
# set to bash so you can set keys before running aquatone.
ENTRYPOINT ["/bin/bash"]
