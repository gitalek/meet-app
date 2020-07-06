install:
	bundle install

run:
	rails s

test:
	RAilS_ENV=test bundle exec rspec
