#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install

# For Ruby on Rails apps uncomment these lines to precompile assets and migrate your database.
bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails db:migrate
bundle exec rails db:seed
