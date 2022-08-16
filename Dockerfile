#applicationのディレクトリ名で置き換えてください
ARG APP_NAME=rails_docker_sample
#使いたいrubyのimage名に置き換えてください
ARG RUBY_VERSION=ruby:2.5.1
#使いたいnodeのversionに置き換えてください
ARG NODE_VERSION='16'

FROM $RUBY_VERSION
ARG APP_NAME
ARG RUBY_VERSION
ARG NODE_VERSION
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo
RUN curl -sL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - \
&& wget --quiet -O - /tmp/pubkey.gpg https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
&& apt-get update -qq \
&& apt-get install -y build-essential nodejs yarn
RUN mkdir /$APP_NAME
WORKDIR /$APP_NAME
RUN gem install bundler:2.3.17
COPY Gemfile /$APP_NAME/Gemfile
COPY Gemfile.lock /$APP_NAME/Gemfile.lock
COPY yarn.lock /$APP_NAME/yarn.lock
RUN bundle install
RUN yarn install
COPY . /$APP_NAME
