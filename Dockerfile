FROM node
WORKDIR /

# Prepare - skip upgrade for dev
RUN apt-get update

# Install normal Packages needed
RUN apt-get install -y -u apt-utils unzip wget curl jruby nano screen htop openssl git ruby-full

# Install nodejs
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs

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
# not sure if these are needed after all. Sources say gcc and g++ will NNEVER work on rpi :/

# Use aq domain.com to automated all options of aquatone.
RUN wget "https://gist.githubusercontent.com/random-robbie/beae1991e9ad139c6168c385d8a31f7d/raw/" -O /bin/aq
RUN chmod 777 /bin/aq

# Install aquatone
RUN gem install aquatone
# Set to bash so you can set keys before running aquatone.
ENTRYPOINT ["/bin/bash"]
