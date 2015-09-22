require "performance_benchmark/version"
require 'benchmark'
require 'singleton'

class PerformanceBenchmark
  include Singleton

  def self.benchmark(name, &block)
    instance.benchmark(name, &block)
  end

  def self.results
    instance.results
  end

  def initialize
    @benchmark = {}
  end

  def benchmark(name, &block)
    environment = Environment.new
    environment.instance_exec(&block)
    environment.prepare
    @benchmark[name] = environment.run
  end

  def results
    @benchmark
  end

  class Environment
    def initialize
      @let ||= {}
    end

    def let(name, &block)
      @let[name.to_sym] = block
    end

    def prepare(&block)
      if block
        @prepare = block
      else
        @prepare && @prepare.call
      end
    end

    def run(&block)
      return Benchmark.realtime(&@run) if @run && !block
      @run = block
    end

    def method_missing(method_sym, *arguments, &block)
      # the first argument is a Symbol, so you need to_s it if you want to pattern match
      if @let.keys.include?(method_sym)
        @let[method_sym].call
      else
        super
      end
    end
  end
end
