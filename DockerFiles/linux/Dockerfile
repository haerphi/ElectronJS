FROM debian:9

# Update systeme
RUN apt-get update -yq \
&& apt-get install curl gnupg -yq \
&& curl -sL https://deb.nodesource.com/setup_14.x | bash \
&& apt-get install nodejs -yq \
&& apt-get clean -y

RUN npm install -g yarn

# copy the current folder to the folder app dans l'image
COPY ../../../ /app/

# change the current work directory
WORKDIR /app

# install packages
RUN yarn install

# default command
CMD yarn build && mv ./dist ./linux