FROM ruby:3.2

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Set working directory
WORKDIR /myapp

# Copy Gemfiles
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy the rest of the code
COPY . .

# Precompile assets (optional for web UI apps)
# RUN bundle exec rake assets:precompile

# Expose port
EXPOSE 3000

# Default command
CMD ["bash"]
