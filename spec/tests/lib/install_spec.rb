# encoding: utf-8

describe Hexx::RSpec::Install, :sandbox do

  describe ".start" do

    subject { try_in_sandbox { described_class.start options } }

    context "without options" do

      let(:options) { %w() }
      before { subject }

      it "creates necessary files" do
        %w(
          .rspec
          Rakefile
          config/metrics/simplecov.yml
        ).each { |file| expect(file).to be_present_in_sandbox }
      end

      it "adds Hexx::RSpec tasks loader to Rakefile" do
        expect(read_in_sandbox "Rakefile")
          .to include "Hexx::RSpec.install_tasks"
      end

    end # context

    context "--no-rakefile" do

      let(:options) { %w(--no-rakefile) }
      before { subject }

      it "creates necessary files" do
        %w(
          .rspec
          config/metrics/simplecov.yml
        ).each { |file| expect(file).to be_present_in_sandbox }
      end

      it "doesn't create a Rakefile" do
        expect("Rakefile").to be_absent_in_sandbox
      end

    end # context

  end # describe .start

end # describe Hexx::RSpec::Install
