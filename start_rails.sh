#!/usr/bin/env sh

ruby -v

gem update --system
gem install bundler
gem pristine --all

cd /vagrant/authorization_resource_server
bundle install
bundle exec rails db:migrate
bundle exec rails db:seed
bundle exec rails s -p 3003 -b0.0.0.0 -d

cd /vagrant/clientA
bundle install
bundle exec rails s -p 3001 -b0.0.0.0 -d
