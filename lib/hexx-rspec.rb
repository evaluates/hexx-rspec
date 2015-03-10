# encoding: utf-8

require "i18n"
require "rake"
require "rspec"
require "thor"
require "yaml"

# Shared namespace for the Hexx-based gems
module Hexx

  require_relative "hexx/rspec/version"
  require_relative "hexx/rspec"
  require_relative "../config/initializer.rb"

end # module Hexx
