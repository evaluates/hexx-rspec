# encoding: utf-8

module Hexx

  module RSpec

    # The utility that loads gem-specific rake tasks
    #
    module Tasks

      # Installs all the necessary rake tasks
      #
      # @example
      #   Hexx::RSpec::Tasks.install
      #
      # @return [self]
      #
      def self.install
        gem_tasks
        rspec_tasks
        custom_tasks

        self
      end

      # @private
      def self.gem_tasks
        require "bundler/gem_tasks"
        Bundler::GemHelper.install_tasks
      end

      # @private
      def self.rspec_tasks
        require "rspec/core/rake_task"
        ::RSpec::Core::RakeTask.new(:spec)
      end

      # @private
      def self.custom_tasks
        Dir[File.expand_path("../tasks/**/*.rake", __FILE__)]
          .each(&method(:load))
      end

      private_class_method :gem_tasks, :rspec_tasks, :custom_tasks

    end # module Load

  end # module RSpec

end # module Hexx
