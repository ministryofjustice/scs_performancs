FROM phusion/baseimage:0.9.12

# Set correct environment variables.
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

###
### Added ruby 2.0
###
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 914D5813
RUN echo "deb http://ppa.launchpad.net/gds/govuk/ubuntu precise main" > /etc/apt/sources.list.d/gds-govuk-precise.list
RUN apt-get update -qq

# Ensure the bash is the latest version
RUN apt-get install --only-upgrade bash

# We need netcat-traditional if we want to generate a metric from the command line
# The default netcat hangs when UDP transport is specified

# Fix broken path to so that 'env node' works again
RUN ln -s /usr/bin/nodejs /usr/bin/node

###
### Added ruby 2.0
###
RUN echo "deb [arch=amd64] http://repo.dsd.io trusty main" > /etc/apt/sources.list.d/dsd.list
RUN apt-get update

RUN apt-get install -y --force-yes --no-install-recommends dsd-ruby2.1-bundler libyaml-0-2 libxslt1.1 libpq5

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

##############################################################################################
################################   MOVE THE ABOVE TO MOJ_RUBY  ##############################
##############################################################################################

# Setup Project
RUN apt-get update
RUN apt-get install -y --force-yes wget build-essential libxslt1.1 libxslt1-dev libxml2-dev libpq-dev
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN useradd -m -d /srv/scs scs

ADD ./run.sh /run.sh
RUN chmod 755 /run.sh

ADD . /srv/scs
RUN rm -rf /srv/scs/.git
RUN chown -R scs: /srv/scs

EXPOSE 8080
USER scs
WORKDIR /srv/scs
