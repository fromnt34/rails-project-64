setup:
		yarn install
		bin/setup

start:
		bin/rails s -p 3000 -b "0.0.0.0"

console:
		bin/rails console

test:
		bin/rails test

.PHONY: test

lint:
		bundle exec rubocop
		bundle exec slim-lint app/views/

check: test lint

seed:
		bin/rails db:seed

ci-setup:
		yarn install
		bundle install --without production development
		RAILS_ENV=test bin/rails db:prepare
		RAILS_ENV=test bin/rails assets:precompile
