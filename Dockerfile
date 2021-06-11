FROM node:16.2.0-alpine3.13 as node

FROM ruby:3.0.1-alpine3.13

COPY --from=node /usr/local/bin/node /usr/local/bin/node
RUN ln -s /usr/local/bin/node /usr/local/bin/nodejs

COPY --from=node /usr/local/lib/node_modules/npm /usr/local/lib/node_modules/npm
RUN ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm
RUN ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npx

COPY --from=node /opt/yarn-v1.22.5 /opt/yarn-v1.22.5
RUN ln -s /opt/yarn-v1.22.5/bin/yarn /usr/local/bin/yarn
RUN ln -s /opt/yarn-v1.22.5/bin/yarnpkg /usr/local/bin/yarnpkg

RUN apk add --no-cache --virtual .build-deps \
    g++ \
    gcc \
    libc-dev \
    libgcc \
    make

ENV APP_HOME /casieandseangotohawaii
ENV BUNDLER_VERSION 2.2.17
ENV APP_PORT 4567

RUN mkdir $APP_HOME

WORKDIR $APP_HOME

COPY Gemfile $APP_HOME/Gemfile
COPY Gemfile.lock $APP_HOME/Gemfile.lock
RUN gem install bundler -v $BUNDLER_VERSION && bundle install

RUN apk del .build-deps

RUN apk add --update tzdata build-base ghostscript ghostscript-fonts imagemagick

COPY . $APP_HOME

EXPOSE $APP_PORT

CMD ["bundle", "exec", "middleman"]
