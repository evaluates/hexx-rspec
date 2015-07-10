# encoding: utf-8

describe "Rake::Task['test:coverage:run']", :tasks do

  around do |example|
    $stdout = StringIO.new
    example.run
    $stdout = STDOUT
  end

  after { Rake::Task["test:coverage:run"].invoke }

  it "loads metric" do
    expect(Hexx::RSpec::Metrics::SimpleCov).to receive(:load)
  end

  it "runs tests" do
    expect(Hexx::RSpec).to receive(:[]).with "bundle exec rspec spec"
  end

end # describe Rake::Task[:test:coverage:run]
