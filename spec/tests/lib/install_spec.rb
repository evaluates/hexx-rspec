# encoding: utf-8

describe Hexx::RSpec::Install, :sandbox do

  describe ".start" do

    before { try_in_sandbox { described_class.start } }

    it "creates necessary files" do
      %w(
        .rspec
        Rakefile
        config/metrics/simplecov.yml
      ).each { |file| expect(file).to be_present_in_sandbox }
    end

    it "adds Hexx::RSpec tasks loader to Rakefile" do
      expect(read_in_sandbox "Rakefile").to include "Hexx::RSpec.install_tasks"
    end
  end
end
