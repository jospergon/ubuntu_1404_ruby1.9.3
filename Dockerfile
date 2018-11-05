FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y git wget links curl rsync bc apt-transport-https libxml2 libxml2-dev libcurl4-openssl-dev openssl
RUN apt-get install -y gawk libreadline6-dev libyaml-dev autoconf libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
RUN apt-get install -y libmysqlclient-dev libmagickwand-dev imagemagick
RUN apt-get install -y nodejs mysql-client-5.6 vim pdftk qt-default libqtwebkit-dev xvfb dbus-x11 gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x xfonts-75dpi
RUN apt-get install -y unzip

RUN git clone https://github.com/sstephenson/rbenv.git /usr/local/rbenv
RUN echo '# rbenv setup' > /etc/profile.d/rbenv.sh
RUN echo 'export RBENV_ROOT=/usr/local/rbenv' >> /etc/profile.d/rbenv.sh
RUN echo 'export PATH="$RBENV_ROOT/bin:$PATH"' >> /etc/profile.d/rbenv.sh
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh
RUN chmod +x /etc/profile.d/rbenv.sh

RUN mkdir /usr/local/rbenv/plugins
RUN git clone https://github.com/sstephenson/ruby-build.git /usr/local/rbenv/plugins/ruby-build

ENV RBENV_ROOT /usr/local/rbenv

ENV PATH "$RBENV_ROOT/bin:$RBENV_ROOT/shims:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

RUN rbenv install 1.9.3-p551
RUN rbenv global 1.9.3-p551

RUN locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'
