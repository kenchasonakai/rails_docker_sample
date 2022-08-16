FROM ruby:2.5.1
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - \
&& wget --quiet -O - /tmp/pubkey.gpg https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
&& apt-get update -qq \
&& apt-get install -y build-essential nodejs yarn
#applicationのディレクトリ名で置き換えてください
RUN mkdir /rails_docker_sample
#applicationのディレクトリ名で置き換えてください
WORKDIR /rails_docker_sample
RUN gem install bundler:2.3.17
#applicationのディレクトリ名で置き換えてください
COPY Gemfile /rails_docker_sample/Gemfile
#applicationのディレクトリ名で置き換えてください
COPY Gemfile.lock /rails_docker_sample/Gemfile.lock
#applicationのディレクトリ名で置き換えてください
COPY yarn.lock /rails_docker_sample/yarn.lock
RUN bundle install
RUN yarn install
#applicationのディレクトリ名で置き換えてください
COPY . /rails_docker_sample
