# encoding: utf-8

describe Hexx::RSpec do

  let(:coverage_settings) { described_class::Metrics::SimpleCov }
  let(:rake_tasks)        { Rake::Task.tasks.map(&:name)        }

  describe ".[]" do

    it "fails with unexecutable string" do
      expect { described_class[''] }.to raise_error RuntimeError
    end

  end # describe .[]

  describe ".load_metrics_for" do

    subject { described_class.load_metrics_for(double) }

    context "when ENV[USE_SIMPLECOV] is set" do

      before  { ENV["USE_SIMPLECOV"] = "true" }

      it "initializes and runs a coverage settings" do
        expect(coverage_settings).to receive(:run)
        subject
      end if RUBY_ENGINE == "ruby"

      it "doesn't run settings" do
        expect(coverage_settings).not_to receive(:run)
        subject
      end unless RUBY_ENGINE == "ruby"

    end # context

    context "when ENV[USE_SIMPLECOV] isn't set" do

      before { ENV["USE_SIMPLECOV"] = nil }

      it "doesn't run settings" do
        expect(coverage_settings).not_to receive(:run)
        subject
      end

    end # context

  end # display .load_metrics_for

end # describe Hexx::RSpec
