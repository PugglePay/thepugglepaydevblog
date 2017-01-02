FROM ubuntu:trusty-20161214

RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

ENV DOCKER=true

ENV HOME=/root
ENV PATH="$HOME/ruby/bin:$PATH"

ENV RUBY_BUILD_VERSION=v20161121
ENV RUBY_VERSION=1.9.3-p194

RUN mkdir /app
WORKDIR /app

# Deps installation deps
RUN apt-get update \
    && apt-get install -y software-properties-common python-software-properties \
       curl git build-essential libreadline-dev zlib1g-dev libzip2 openssl \
       libssl-dev

# Add github to known hosts
RUN mkdir -p $HOME/.ssh && touch $HOME/.ssh/known_hosts
RUN ssh-keyscan -t rsa github.com >> $HOME/.ssh/known_hosts 2>&1

# Install ruby
RUN git clone --branch $RUBY_BUILD_VERSION git://github.com/sstephenson/ruby-build.git $HOME/ruby-build \
    && $HOME/ruby-build/install.sh \
    && ruby-build $RUBY_VERSION $HOME/ruby \
    && echo 'gem: --no-ri --no-rdoc' > $HOME/.gemrc

# # Install ruby deps
ENV RUBY_BUNDLER_VERSION=1.12.5
RUN gem install bundler -v $RUBY_BUNDLER_VERSION
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

# Install Heroku CLI
RUN apt-get install -y apt-transport-https \
    && add-apt-repository "deb https://cli-assets.heroku.com/branches/stable/apt ./" \
    && curl -L https://cli-assets.heroku.com/apt/release.key | sudo apt-key add - \
    && apt-get update \
    && apt-get install -y heroku

CMD ["/bin/bash"]
