# encoding: utf-8
begin
  require "bundler/setup"
rescue LoadError
  puts "You must `gem install bundler` and `bundle install` to run rake tasks"
  exit
end

# Loads bundler tasks
Bundler::GemHelper.install_tasks

# Loads the Hexx::RSpec without tasks
require "hexx-rspec"

# Sets the :spec task to default
task :default do
  system "bundle exec rspec spec"
end
