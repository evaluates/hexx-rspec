desc "Runs a test rspec in a bundle environment, without monitoring coverage."
task :test do
  Hexx::RSpec["bundle exec rspec spec"]
end
