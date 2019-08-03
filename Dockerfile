FROM ubuntu:trusty

ENV TERM=xterm-256color

# Install nodejs
RUN apt-get update && \
    apt-get install curl -y && \
    curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - && \
    apt-get install -y nodejs

COPY . /app
WORKDIR /app

# Install application dependencies
RUN npm install -g mocha && \
    npm install

# Set mocha test runner as entrypoint
ENTRYPOINT ["mocha"]
