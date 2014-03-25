#!/usr/bin/env sh
cd spec/dummy && bundle install --without debug && bundle exec rake helpdesk:prepare_ci_env db:create db:migrate && cd ../.. && bundle exec rake db:migrate && bundle exec rake db:test:prepare && bundle exec rspec -bfs spec
