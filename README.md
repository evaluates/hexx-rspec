# Hexx::RSpec 

[![Gem Version](https://img.shields.io/gem/v/hexx-rspec.svg?style=flat)][gem]
[![Build Status](https://img.shields.io/travis/nepalez/hexx-rspec/master.svg?style=flat)][travis]
[![Dependency Status](https://img.shields.io/gemnasium/nepalez/hexx-rspec.svg?style=flat)][gemnasium]
[![Code Climate](https://img.shields.io/codeclimate/github/nepalez/hexx-rspec.svg?style=flat)][codeclimate]
[![Coverage](https://img.shields.io/coveralls/nepalez/hexx-rspec.svg?style=flat)][coveralls]

[gem]: https://rubygems.org/gems/hexx-rspec 
[travis]: https://travis-ci.org/nepalez/hexx-rspec 
[gemnasium]: https://gemnasium.com/nepalez/hexx-rspec 
[codeclimate]: https://codeclimate.com/github/nepalez/hexx-rspec 
[coveralls]: https://coveralls.io/r/nepalez/hexx-rspec 

The module adds RSpec, Coveralls and Simplecov dependencies to the gem, and adds their default settings.

## Installation

Add this line to your application's Gemfile:

```ruby
group :test, :development do
  gem "hexx-rspec"
end
```

Then execute:

```
bundle
```

And run the task from the application root:

```
hexx-rspec install
```

Require the gem in the `spec_helper.rb` **before** loading application:

```ruby
# spec/spec_helper.rb
require "hexx-rspec"

# Loads coveralls runtime metric in the application's scope.
Hexx::RSpec.load_metrics_for(self)

# Loads the application under the test.
require "my_app"
```

Review the `config/metrics/simplecov.yml` for coverage report settings.

## Usage

Use `rake test` of `rake test:coverage` respectively.

Or run `rake test:coverage:run` and `rake test:coverage:display` separately.

## Compatibility

Tested under rubies:

* MRI 1.9.3+
* Rubinius 2+ (1.9 and 2.0+ modes)
* JRuby 1.7+ (1.9 and 2.0+ modes)

[RSpec] 3.0+ used for testing

[RSpec]: http://rspec.info

## Contributing

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with Rakefile or version
  (if you want to have your own version, that is fine but bump version
  in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## License

See [MIT LICENSE](file: LICENSE).
