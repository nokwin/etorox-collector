FROM node:10.15.3-alpine

# Define working dir
WORKDIR /app

# Define yarn vesrion
ENV YARN_VERSION 1.15.2

# Install yarn
RUN apk add --no-cache --virtual .build-deps-yarn curl \
  && curl -fSLO --compressed "https://yarnpkg.com/downloads/$YARN_VERSION/yarn-v$YARN_VERSION.tar.gz" \
  && tar -xzf yarn-v$YARN_VERSION.tar.gz -C /opt/ \
  && ln -snf /opt/yarn-v$YARN_VERSION/bin/yarn /usr/local/bin/yarn \
  && ln -snf /opt/yarn-v$YARN_VERSION/bin/yarnpkg /usr/local/bin/yarnpkg \
  && rm yarn-v$YARN_VERSION.tar.gz \
  && apk del .build-deps-yarn

# Copying all sources to container
COPY . .

# Installing modules
RUN yarn install

# Exposing port
EXPOSE 3000

CMD ["yarn", "start"]