# encoding: utf-8

describe Hexx::RSpec::Tasks do

  describe ".install" do

    let(:rake_tasks) { Rake::Task.tasks.map(&:name) }

    before { described_class.install }

    it "loads Gem tasks" do
      expect(rake_tasks).to include("build", "install", "release")
    end

    it "loads RSpec tasks" do
      expect(rake_tasks).to include("spec")
    end

    it "loads described_class tasks" do
      expect(rake_tasks).to include(*%w(
        test:coverage
        test:coverage:display
        test:coverage:run
        test
      ))
    end

  end # display .install

end # describe Hexx::RSpec
