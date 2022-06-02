# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  * ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-linux]

* System dependencies
  * Postgresql
  * Rails 7.0.3

* Configuration
  * bundle install to install all the gems
  * Setup the database

* Database creation
  * bundle exec rake db:create
  * bundle exec rake db:migrate

* How to run the test suite
  * bin/rails test test/models/order_test.rb
  
* short explanation of your technical choices
  * Use the default test suite of rails for simplicity.
  * I create a aditional table for the fee to make more simple the Order class because is the main class in wich wold be a big logic in the future.
  * Dont secure the API because of the time but it is so important.