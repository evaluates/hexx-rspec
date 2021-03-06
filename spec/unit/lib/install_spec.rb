# encoding: utf-8

describe Hexx::RSpec::Install, :sandbox do

  describe ".start", :capture do

    before { try_in_sandbox { described_class.start options } }

    context "without options" do

      let(:options) { %w() }

      it "creates main files" do
        %w(.rspec config/metrics/simplecov.yml spec/spec_helper.rb)
          .each { |file| expect(file).to be_present_in_sandbox }
      end

      it "adds Hexx::RSpec tasks loader to Rakefile" do
        expect(read_in_sandbox "Rakefile").to include "Hexx::RSpec.install"
      end

    end # context

    context "--no-rakefile" do

      let(:options) { %w(--no-rakefile) }

      it "creates main files" do
        %w(.rspec config/metrics/simplecov.yml spec/spec_helper.rb)
          .each { |file| expect(file).to be_present_in_sandbox }
      end

      it "doesn't create a Rakefile" do
        expect("Rakefile").to be_absent_in_sandbox
      end

    end # context

  end # describe .install

end # describe Hexx::RSpec
