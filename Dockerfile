FROM node:12

ARG FOR_BRANCH=master
RUN apt-get update && \
    apt-get install -y git && \
    git clone https://mirror.ghproxy.com/https://github.com/botpress/botpress /bp && \
    rm -fR /var/lib/apt/lists

WORKDIR /bp

COPY . /bp/modules/channel-rocketchat
RUN yarn && \
    yarn build && \ 
    rm -fR "/usr/local/share/.cache/yarn/v6/npm-asteroid*/node_modules/asteroid/test" && \
    yarn package
