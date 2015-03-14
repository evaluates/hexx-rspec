# Loads the RSpec support files.
require "rspec"
Dir[File.expand_path "spec/support/*.rb"].each { |file| require file }

# encoding: utf-8
require "coveralls"
Coveralls.wear!

# Loads the code of the module with the RSpec test rspec.
require "hexx-rspec"
