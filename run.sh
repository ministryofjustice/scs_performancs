#!/bin/bash

RAILS_ENV=production /usr/local/bin/bundle exec rake db:migrate
RAILS_ENV=production /usr/local/bin/bundle exec unicorn -E production -c config/unicorn.rb
