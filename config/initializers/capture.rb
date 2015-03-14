# encoding: utf-8

RSpec.configure do |config|

  # Captures stdout
  config.around :each, :capture do |example|
    begin
      $stdout = StringIO.new
      example.run
      result = $stdout.string
    ensure
      $stdout = STDOUT
    end
    result.to_s
  end

end # RSpec.configure
