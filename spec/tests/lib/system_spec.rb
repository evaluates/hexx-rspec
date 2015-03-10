# encoding: utf-8

describe Hexx::RSpec::System do

  it "is a string" do
    subject = described_class.new ""
    expect(subject).to be_kind_of String
  end

  describe ".new" do

    it "removes repetitive spaces from source" do
      subject = described_class.new "foo   bar   \n   baz"

      expect(subject).to eq "foo bar \n baz"
    end

    it "strips the source" do
      subject = described_class.new "  foo bar \n baz  "

      expect(subject).to eq "foo bar \n baz"
    end

  end # describe .new

  describe "#lines" do

    it "strips lines" do
      subject = described_class.new " foo bar \n baz "

      expect(subject.lines).to eq ["foo bar", "baz"]
    end

    it "ignores empty lines" do
      subject = described_class.new " \nfoo bar\n \nbaz\n "

      expect(subject.lines).to eq ["foo bar", "baz"]
    end

    it "returns an array of utilities" do
      subject = described_class.new "foo bar\nbaz"

      subject.lines.each { |line| expect(line).to be_kind_of described_class }
    end

  end # describe #lines

  describe "#call" do

    before { allow_any_instance_of(described_class).to receive :system }

    it "returns itself (allows chaining)" do
      subject = described_class.new "foo"

      expect(subject.call).to eq subject
    end

    context "single line" do

      subject { described_class.new "foo bar" }
      after   { subject.call }

      it "sends itself to system" do
        expect(subject).to receive(:system).with(subject)
      end

    end # context

    context "multiline string" do

      subject { described_class.new "foo bar\nbaz" }
      after   { subject.call }

      it "sends each line to system" do
        subject.lines.each do |line|
          expect(subject).to receive(:system).with(line).ordered
        end
      end

    end # context

  end # describe #call

  describe ".call" do

    let!(:value)   { "foo bar\nbaz" }
    let!(:utility) { described_class.new value }

    before { allow(described_class).to receive(:new) { utility } }

    it "constucts the utility object and calls it" do
      expect(described_class).to receive(:new).with(value)
      expect(utility).to receive :call
      described_class.call value
    end

  end # describe .call

end
