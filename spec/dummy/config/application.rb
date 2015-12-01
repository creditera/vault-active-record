require 'bundler'

Bundler.require :default, :test

require "vault"

require File.expand_path('../initializers/vault', __FILE__)

require File.expand_path('../boot', __FILE__)

ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  host:     'localhost',
  username: 'root',
  password: 'root',
  database: 'db/test.sqlite3'
)

module Dummy; end

