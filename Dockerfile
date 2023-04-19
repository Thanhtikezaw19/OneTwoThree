FROM ruby:2.7.5

# Set up the working directory
WORKDIR /app

# Install dependencies
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  default-libmysqlclient-dev \
  nodejs \
  yarn

# Copy the Gemfile and Gemfile.lock
COPY Gemfile* /app/

# Install Gems
RUN bundle install

# Copy the rest of the application
COPY . /app/

# Expose port 3000
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
