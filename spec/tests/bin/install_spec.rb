# encoding: utf-8

describe "hexx-rspec install", :sandbox do

  before { try_in_sandbox { `hexx-rspec install` } }

  it "creates necessary files" do
    %w(
      .rspec
      Guardfile
      Rakefile
      config/metrics/simplecov.yml
    ).each { |file| expect(file).to be_present_in_sandbox }
  end

end # describe hexx-rspec install
