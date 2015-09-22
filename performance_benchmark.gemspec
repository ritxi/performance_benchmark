# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'performance_benchmark/version'

Gem::Specification.new do |spec|
  spec.name          = "performance_benchmark"
  spec.version       = PerformanceBenchmark::VERSION
  spec.authors       = ["Ricard Forniol Agustí"]
  spec.email         = ["ricard@forniol.cat"]

  spec.summary       = %q{Small dsl to write peformance test}
  spec.description   = %q{This gem is an rspec like simple DSL to perform code
                          benchmarking using ruby benchmark library under the
                          hood and group results in a hash.}
  spec.homepage      = "http://github.com/ritxi/performance_benchmark"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", '~> 0'
end
