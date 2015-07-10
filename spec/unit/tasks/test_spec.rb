# encoding: utf-8

describe "Rake::Task['test']", :tasks do

  after { Rake::Task["test"].invoke }

  it "runs tests" do
    expect(Hexx::RSpec).to receive(:[]).with "bundle exec rspec spec"
  end

end # describe Rake::Task[:test]
