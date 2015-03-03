#!/usr/bin/env sh

ruby -v

gem update --system
gem install bundler
gem pristine --all

cd /vagrant/authorization_resource_server
bundle install
bundle exec rails db:migrate
bundle exec rails db:seed
bundle exec rails s -p 3003 -d

cd /vagrant/clientA
bundle install
bundle exec rails s -p 3001 -d

cd /vagrant/clientB
bundle install
bundle exec rails s -p 3002 -d

