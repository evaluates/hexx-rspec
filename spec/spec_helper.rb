# encoding: utf-8

if RUBY_ENGINE == "ruby"
  require "coveralls"
  Coveralls.wear!
end

require "hexx-rspec"

require_relative "support/prepare_settings"
require_relative "support/tasks"
