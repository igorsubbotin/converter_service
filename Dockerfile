FROM ubuntu:14.04

MAINTAINER igor.subbotin.dev@gmail.com

RUN curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
    && apt-get install -y nodejs

# Install Node...
RUN apt-get install -y npm

# Copy app to /src
COPY . /src

# Install app and dependencies into /src
RUN cd /src; npm install

EXPOSE 8080

CMD cd /src && node ./app.js