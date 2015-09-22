require 'spec_helper'

describe PerformanceBenchmark do
  describe 'PerformanceBenchmark::VERSION' do
    subject { PerformanceBenchmark::VERSION }
    it { is_expected.not_to be_nil }
  end

  describe 'benchmark' do
    class Foo
      class << self
        def bar
          'hello'
        end

        def buff
          'bye'
        end

        def ahh!
          'Munch'
        end
      end
    end

    let(:benchmark) do
      PerformanceBenchmark.benchmark 'Test!' do
        let(:foo) { Foo.bar }
        prepare { Foo.buff }

        run { foo; Foo.ahh! }
      end
    end

    describe '#benchmark' do
      before do
        expect(Foo).to receive(:bar).once
        expect(Foo).to receive(:buff).once
        expect(Foo).to receive(:ahh!).once
      end

      it { benchmark }
    end

    describe '#results' do
      before { benchmark }
      subject { PerformanceBenchmark.results }

      it { expect(subject.keys).to include('Test!') }
      it { expect(subject.values.first).to be_kind_of(Float) }
    end
  end

  describe PerformanceBenchmark::Environment do
    let(:environment) { described_class.new }

    describe '#let' do
      subject { environment.hello }

      before { environment.let(:hello) { 'foooo' } }

      it { is_expected.to eq('foooo') }
    end

    describe '#run' do
      let(:run_block) { -> { 'hello' } }
      subject { environment.run(&run_block) }

      it { is_expected.to eq(run_block) }

      context 'run it' do
        before { environment.run(&run_block) }
        subject { environment.run }

        it { is_expected.to be_kind_of(Float) }
      end
    end

    describe '#prepare' do
      let(:run_block) { -> { 'hello' } }
      subject { environment.prepare(&run_block) }

      it { is_expected.to eq(run_block) }

      context 'run it' do
        subject { environment.prepare }

        context 'with block' do
          before { environment.prepare(&run_block) }

          it { is_expected.to eq('hello') }
        end

        context 'without block' do
          it { is_expected.to be_nil }
        end
      end
    end
  end
end
