# encoding: utf-8

describe Hexx::RSpec do

  let(:coverage_settings) { described_class::Metrics::SimpleCov }

  describe ".load_metrics_for" do

    subject { described_class.load_metrics_for(double) }

    it "returns self" do
      expect(subject).to eq described_class
    end

    context "when ENV[USE_SIMPLECOV] is set" do

      before  { ENV["USE_SIMPLECOV"] = "true" }

      it "initializes and runs a coverage settings" do
        expect(coverage_settings).to receive(:run)
        subject
      end
    end

    context "when ENV[USE_SIMPLECOV] isn't set" do

      before { ENV["USE_SIMPLECOV"] = nil }

      it "doesn't run settings" do
        expect(coverage_settings).not_to receive(:run)
        subject
      end
    end

  end # display .load_metrics_for

end # display Hexx::RSpec