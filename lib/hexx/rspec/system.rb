# encoding: utf-8

module Hexx

  module RSpec

    # The utility sends multiline string to system
    #
    # Allows stubbing system calls in specifications.
    #
    # @example
    #   System.call %(
    #     inch --pedantic
    #     rubocop
    #   )
    #
    # @api private
    class System < String

      # Initializes multiline text to be sent to system
      #
      # Removes repetitive spaces from itself
      #
      # @param [#to_s] _
      #   Multiline text to be sent to system
      #
      # @return [undefined]
      def initialize(_)
        super
        strip!
        gsub!(/ {2,}/, " ")
      end

      # Returns non-empty lines without trailing spaces
      #
      # @return [Array<String>]
      def lines
        Array(super) # Array() is needed to support rubies 1.9.3
          .map(&:strip)
          .reject(&:empty?)
      end

      # Sends itself to system line by line
      #
      # @return [self]
      def call
        lines.each(&method(:system))

        self
      end

      # Sends multiline string to system
      #
      # @example (see Hexx::RSpec::System)
      #
      # @param  (see #initialize)
      #
      # @return [Hexx::RSpec::System]
      #   utility object (allows chaining)
      def self.call(text)
        new(text).call
      end

    end # class System

  end # module RSpec

end # module Hexx
