# encoding: utf-8

module Hexx

  # Namespace for the module.
  #
  # @api public
  module RSpec

    require_relative "rspec/system"
    require_relative "rspec/metrics"

    class << self

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
      def load_metrics_for(scope)
        return unless ENV["USE_SIMPLECOV"]
        scope.instance_eval { Hexx::RSpec::Metrics::SimpleCov.run }

        self
      end

    end # singleton class RSpec

  end # module RSpec

end # module Hexx
