FROM node:dubnium-jessie

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y pandoc texlive-latex-recommended

WORKDIR /workdir

COPY package.json /workdir/package.json
COPY package-lock.json /workdir/package-lock.json
RUN npm ci

COPY . /workdir

CMD npm run build
