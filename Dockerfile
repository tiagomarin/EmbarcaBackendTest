# Use the official Ruby 2.7 image
FROM ruby:2.7

# Set environment variables specific to EmbarcaAiBackendTest
ENV EMBARCA_AI_ROOT /var/www/embarca_ai_backend
ENV RAILS_ENV 'development'

# Create and set the working directory
RUN mkdir -p $EMBARCA_AI_ROOT
WORKDIR $EMBARCA_AI_ROOT

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Copy the Gemfile and install gems before copying the whole project
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the main application
COPY . .

# Start the main process
CMD ["rails", "server", "-b", "0.0.0.0"]
