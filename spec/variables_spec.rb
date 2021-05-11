require 'rspec'
require_relative '../lib/variables'

describe Variables do
  subject { described_class.new('js_test.js') }
  describe '#initialize' do
    context 'When argument is missing' do
      it 'Raise an error' do
        expect { described_class.new }.to raise_error(ArgumentError)
      end
    end
    context 'when create_variables method is called' do
      it 'create all_variables hash' do
        expect(subject.all_vars).to eql({ 1 => 'age', 2 => 'age', 3 => 'score', 6 => 'person' })
      end
    end
  end

  describe '#add_variable' do
    context 'when arguments are missing' do
      it 'Raise an error for 1 missing argument' do
        expect { subject.add_variable(20) }.to raise_error(ArgumentError)
      end
      it 'Raise an error for 2 missing argument' do
        expect { subject.add_variable }.to raise_error(ArgumentError)
      end
    end
    context 'when we call add_variable' do
      it 'all_vars hash is colecting line and name of the variable as a key:value pair' do
        subject.add_variable('var1', 20)
        expect(subject.all_vars).to include(20 => 'var1')
      end
    end
  end
  describe 'repeats?' do
    context 'when all_vars hash has any repeating values' do
      it 'returns true' do
        expect(subject.repeats?).to be true
      end
    end
  end
end
