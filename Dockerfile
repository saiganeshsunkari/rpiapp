FROM resin/raspberrypi-node:slim
RUN apt-get update && apt-get install -yq \
   alsa-utils libasound2-dev && \
      apt-get clean && rm -rf /var/lib/apt/lists/*
WORKDIR /usr/src/app
COPY package.json package.json
RUN JOBS=MAX npm install --production --unsafe-perm && npm cache clean && rm -rf /tmp/*
COPY . ./
ENV INITSYSTEM on
EXPOSE 8080
CMD [ "npm", "start" ]


