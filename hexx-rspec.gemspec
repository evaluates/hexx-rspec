$:.push File.expand_path("../lib", __FILE__)
require "hexx/rspec/version"

Gem::Specification.new do |gem|

  gem.name        = "hexx-rspec"
  gem.version     = Hexx::RSpec::VERSION.dup
  gem.author      = "Andrew Kozin"
  gem.email       = "andrew.kozin@gmail.com"
  gem.homepage    = "https://github.com/nepalez/hexx-rspec"
  gem.summary     = "RSpec settings."
  gem.description = "RSpec, Coveralls and Simplecov settings."
  gem.license     = "MIT"

  gem.files            = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  gem.test_files       = Dir["spec/**/*", "Rakefile", "Guardfile"]
  gem.extra_rdoc_files = Dir["LICENSE", "README.md", ".yardopts"]

  gem.required_ruby_version = ">= 1.9.3"

  gem.add_runtime_dependency "coveralls", "~> 0.7"
  gem.add_runtime_dependency "guard-rspec", "~> 4.5"
  gem.add_runtime_dependency "i18n", "~> 0.7"
  gem.add_runtime_dependency "rake", "~> 10.3"
  gem.add_runtime_dependency "rspec", "~> 3.0"
  gem.add_runtime_dependency "simplecov", "~> 0.9"
  gem.add_runtime_dependency "thor", "~> 0.19"

end
