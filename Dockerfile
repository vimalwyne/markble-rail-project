FROM ruby:3.2

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /myapp
COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .


# Expose port
EXPOSE 3000

CMD ["bash"]
