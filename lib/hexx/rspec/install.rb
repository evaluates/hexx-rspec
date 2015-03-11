module Hexx
  module RSpec

    # The generator creates a Rakefile in a destination root
    class Install < Thor::Group
      include Thor::Actions

      # @!scope class
      # @!method start
      # Populates files into current directory
      #
      # @return [undefined]
      #
      # @api public

      class_option(
        :rakefile,
        default: true,
        desc: "Create the Rakefile",
        type: :boolean
      )

      # @private
      def self.source_root
        @source_root ||= File.expand_path "../install", __FILE__
      end

      namespace :install
      desc "Installs the 'hexx-rspec' gem."

      # @private
      def create_rakefile
        return unless options[:rakefile]
        copy_file "Rakefile"
      end

      # @private
      def create_rspec
        copy_file "_rspec", ".rspec"
      end

      # @private
      def create_simplecov
        copy_file "simplecov.yml", "config/metrics/simplecov.yml"
      end

    end # class Install

  end # module RSpec

end # module Hexx
