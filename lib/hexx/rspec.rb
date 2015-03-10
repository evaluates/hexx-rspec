# encoding: utf-8

module Hexx

  # Namespace for the module.
  #
  # @api public
  module RSpec

    require_relative "rspec/system"
    require_relative "rspec/metrics"
    require_relative "rspec/install"

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

      # Loads all the necessary rake tasks
      #
      # @example
      #   Hexx::RSpec.install_tasks
      #
      # @return [self]
      def install_tasks
        load_gem_tasks
        load_rspec_tasks
        load_custom_tasks

        self
      end

      private

      def load_gem_tasks
        require "bundler/gem_tasks"
        ::Bundler::GemHelper.install_tasks

        self
      end

      def load_rspec_tasks
        require "rspec/core/rake_task"
        ::RSpec::Core::RakeTask.new(:spec)

        self
      end

      def load_custom_tasks
        tasks = ::File.expand_path "../../tasks/**/*.rake", __FILE__
        ::Dir[tasks].each { |task| load task }

        self
      end

    end # singleton class RSpec

  end # module RSpec

end # module Hexx
