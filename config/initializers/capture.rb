# encoding: utf-8

RSpec.configure do |config|

  def capture_stdout
    $stdout = StringIO.new
    yield if block_given?

    $stdout.string
  rescue
    ""
  ensure
    $stdout = STDOUT
  end

  config.around :each, :capture do |example|
    capture_stdout { example.run }
  end

end # RSpec.configure
