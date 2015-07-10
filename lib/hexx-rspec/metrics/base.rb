# encoding: utf-8

module Hexx

  module RSpec

    module Metrics

      # Base class for metrics configurators
      #
      # To be used by the 'hexx-suit' module as well
      class Base

        # Loads metric settings and configures the current metric
        #
        # @return [Hexx::RSpec::Metrics]
        #   the configured metric object
        def self.load
          __send__(:new).load
        end

        # Configures and runs the current metric
        #
        # @return (see #run)
        def self.run
          load.run
        end

        # Loads the configuration file and configures the metric
        #
        # @return [self]
        #
        # @api private
        def load
          self
        end

        # Runs the metric
        #
        # @abstract
        #
        # @return [undefined]
        #
        # @api private
        def run; end

        # @note
        #   The class has a private constructor.
        #   Use methods {.load} or {.run}.
        private_class_method :new

        private

        # Extracts a hash of settings from the current file
        #
        # @return [Hash]
        #
        # @api private
        def settings
          @settings ||= file ? YAML.load_file(file) : {}
        end

        # Returns the name of the settings file
        #
        # @return [String]
        #   when the file is present in the config/metrics folder
        # @return [nil]
        #   when the file is absent in the config/metrics folder
        #
        # @api private
        def file
          @file ||= Dir["config/metrics/#{ name }.yml"].first
        end

        # The name of the current metric
        #
        # @abstract
        #
        # @return [Symbol]
        attr_reader :name
      end
    end
  end
end
