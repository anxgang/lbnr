FROM ruby:2.7.1

ENV BUNDLE_PATH /usr/local/bundle
ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_ENV production

ADD Gemfile /lbnr/Gemfile
ADD Gemfile.lock /lbnr/Gemfile.lock
RUN cd /lbnr && bundle install
ADD . /lbnr
WORKDIR /lbnr
RUN rake assets:precompile

ENTRYPOINT ["bundle","exec","rails","s","-e","production","-b","0.0.0.0"]
CMD ["-p","3000"]
