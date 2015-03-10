# encoding: utf-8

module Hexx

  module RSpec

    # Contains metric configurators
    #
    # Any configurator loads metric settings from a corresponding yaml,
    # sets necessary environments via {.load} method,
    # and then runs the metric via {.run} method.
    #
    # Configurators loads their own dependencies in a corresponding constructor.
    module Metrics

      require_relative "metrics/base"
      require_relative "metrics/simplecov.rb"

    end

  end # module RSpec

end # mdoule Hexx
