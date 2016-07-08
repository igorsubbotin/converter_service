FROM ubuntu:14.04

MAINTAINER igor.subbotin.dev@gmail.com

# RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
#    && apt-get install -y nodejs build-essential
# RUN apt-get install -y npm
RUN git clone git://github.com/creationix/nvm.git ~/nvm \
    && . ~/nvm/nvm.sh \
    && nvm install 4.4.5 \
    && nvm use 4.4.5 \
    && nvm alias default 4.4.5

# Copy app to /src
COPY . /src

# Install app and dependencies into /src
RUN cd /src; npm install

EXPOSE 8080

CMD cd /src && node ./app.js