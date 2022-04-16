FROM node:lts-buster

RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

COPY session-md.json .

RUN npm install
RUN npm install yt-search@latest

COPY . .

EXPOSE 5000

CMD ["node", "run", "start"]
