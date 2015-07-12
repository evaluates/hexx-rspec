# encoding: utf-8

describe "Rake::Task['test:coverage:display']", :tasks do

  before { ENV.delete "SIMPLECOV_OUTPUT" }
  after  { Rake::Task["test:coverage:display"].invoke }

  it "loads metric" do
    expect(Hexx::RSpec::Metrics::SimpleCov).to receive(:load)
  end

  it "displays results for metric settings" do
    expect(Hexx::RSpec).to receive(:[]).with "launchy tmp/coverage/index.html"
  end

  it "displays results for default ENV settings" do
    allow(Hexx::RSpec::Metrics::SimpleCov).to receive(:load)
    expect(Hexx::RSpec).to receive(:[]).with "launchy coveralls/index.html"
  end

  it "displays results for custom ENV settings" do
    allow(Hexx::RSpec::Metrics::SimpleCov).to receive(:load)
    ENV["SIMPLECOV_OUTPUT"] = "tmp/custom"
    expect(Hexx::RSpec).to receive(:[]).with "launchy tmp/custom"
  end

end # describe Rake::Task[:test:coverage:display]
