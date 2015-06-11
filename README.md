# Hexx::RSpec   [![Documentation Status](https://readthedocs.org/projects/hexx-rspec/badge/?version=latest)][readthedocs]

[![Gem Version](https://img.shields.io/gem/v/hexx-rspec.svg?style=flat)][gem]
[![Build Status](https://img.shields.io/travis/hexx-rb/hexx-rspec/master.svg?style=flat)][travis]
[![Dependency Status](https://img.shields.io/gemnasium/hexx-rb/hexx-rspec.svg?style=flat)][gemnasium]
[![Code Climate](https://img.shields.io/codeclimate/github/hexx-rb/hexx-rspec.svg?style=flat)][codeclimate]
[![Coverage](https://img.shields.io/coveralls/hexx-rb/hexx-rspec.svg?style=flat)][coveralls]
[![Inline docs](http://inch-ci.org/github/hexx-rb/hexx-rspec.svg)][inch]

[readthedocs]: https://readthedocs.org/projects/hexx-rspec/?badge=latest
[gem]: https://rubygems.org/gems/hexx-rspec 
[travis]: https://travis-ci.org/hexx-rb/hexx-rspec 
[gemnasium]: https://gemnasium.com/hexx-rb/hexx-rspec 
[codeclimate]: https://codeclimate.com/github/hexx-rb/hexx-rspec 
[coveralls]: https://coveralls.io/r/hexx-rb/hexx-rspec
[inch]: https://inch-ci.org/github/hexx-rb/hexx-rspec

The module adds RSpec, Coveralls and Simplecov dependencies with their default settings.

Installation
------------

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

Usage
-----

Use `rake test` of `rake test:coverage` respectively.

Or run `rake test:coverage:run` and `rake test:coverage:display` separately.

Compatibility
-------------

Tested under [rubies with API 1.9.3+](.travis.yml).

Uses [RSpec] 3.0+ for testing

[RSpec]: http://rspec.info

Contributing
------------

* Read the [STYLEGUIDE](config/metrics/STYLEGUIDE)
* [Fork the project](https://github.com/hexx-rb/hexx-rspec)
* Create your feature branch (`git checkout -b my-new-feature`)
* Add tests for it
* Commit your changes (`git commit -am '[UPDATE] Add some feature'`)
* Push to the branch (`git push origin my-new-feature`)
* Create a new Pull Request

License
-------

See [MIT LICENSE](file: LICENSE).
