namespace :test do

  namespace :coverage do

    metric = Hexx::RSpec::Metrics::SimpleCov
    output = -> { ENV.fetch("SIMPLECOV_OUTPUT") { "coveralls/index.html" } }

    # Loads settings for simplecov from the 'config/metrics/simplecov.yml'
    task :configure do
      metric.load
    end

    desc "Runs tests under the coveralls"
    task run: [:configure, :test] do
      puts "see results in #{output.call}"
    end

    desc "Displays results of the coveralls last run"
    task display: :configure do
      Hexx::RSpec["launchy #{output.call}"]
    end
  end

  desc "Runs tests under the coveralls and displays the results"
  task coverage: %w(coverage:run coverage:display)

end # namespace :test
