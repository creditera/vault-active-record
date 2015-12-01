#!/usr/bin/env rake
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

Bundler::GemHelper.install_tasks

# Extract tasks for interacting with the dummy application
APP_RAKEFILE = File.expand_path("../spec/dummy/Rakefile", __FILE__)

require "rspec/core/rake_task"
RSpec::Core::RakeTask.new(:spec)
task default: :spec
