# PerformanceBenchmark

This gem is an rspec like simple DSL to perform code benchmarking using ruby benchmark library under the hood and group results in a hash.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'performance_benchmark'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install performance_benchmark

## Usage

Define test benchmarking blocks using `PerformanceBenchmark.benchmark` method. Within them variable and preprocessing blocks can be defined using `let` and `prepare`. Finally `run` block defines code to be benchmarked.

`benchmark` blocks are executed one after the other. At the end results can be accessed through `PerformanceBenchmark.results`

```ruby
require 'performance_benchmark'

PerformanceBenchmark.benchmark 'Test1' do
  let(:foo) { 'rspec like variable' }
  prepare do
    # do some stuff before run
  end

  run do
    # process to be run under benchmark
  end
end

PerformanceBenchmark.benchmark 'Test2' do
  let(:foo) { 'rspec like variable' }
  prepare do
    # do some stuff before run
  end

  run do
    # process to be run under benchmark
  end
end

puts PerformanceBenchmark.results
# => { 'Test1' => 2, 'Test2' => 5 }
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/performance_benchmark. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

