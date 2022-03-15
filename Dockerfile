# syntax=docker/dockerfile:1
FROM ruby:2.7
RUN apt-get update -qq
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 4000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]