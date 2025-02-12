# Use the official Ruby image as the base image
FROM ruby:3.3.7-slim

# Install dependencies
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    build-essential \
    curl \
    libjemalloc2 \
    libvips \
    sqlite3 \
    libyaml-dev \ 
    pkg-config  && \
    rm -rf /var/lib/apt/lists/*
# Set the working directory
WORKDIR /rails

# Copy the Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install && \
    rm -rf ~/.bundle/ /usr/local/bundle/ruby/*/cache /usr/local/bundle/ruby/*/bundler/gems/*/.git

# Copy the application code
COPY . .

# Precompile bootsnap
RUN bundle exec bootsnap precompile --gemfile

# Expose the port the app runs on
EXPOSE 3000

# Start the application
CMD ["rails", "server", "-b", "0.0.0.0"]