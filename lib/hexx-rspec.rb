# encoding: utf-8

require "i18n"
require "rake"
require "rspec"
require "thor"
require "yaml"

require_relative "hexx-rspec/initializers"
require_relative "hexx-rspec/install"
require_relative "hexx-rspec/tasks"
require_relative "hexx-rspec/metrics/base"
require_relative "hexx-rspec/metrics/simplecov"

module Hexx

  module RSpec

    # Wraps calls to system
    #
    # @param [#to_s] string
    #
    # @return [undefined]
    # 
    def self.[](string)
      system(string)
      fail "finished with status #{$?.exitstatus}" unless $?.success?
    end

    # Loads coverage metric in a given scope
    #
    # Checks if a corresponding environment is set
    #
    # @example
    #   # spec/spec_helper.rb
    #   Hexx::RSpec.load_metrics_for(self)
    #
    # @param [Object] scope
    #
    # @return [self]
    def self.load_metrics_for(scope)
      return unless ENV["USE_SIMPLECOV"] && (RUBY_ENGINE == "ruby")
      scope.instance_eval { Metrics::SimpleCov.run }
    end

  end # module RSpec

end # module Hexx
