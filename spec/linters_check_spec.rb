require 'rspec'
require_relative '../lib/linters_check'
require 'colorize'

describe LinterCheck do
  subject { described_class.new('js_test.js') }
  describe '#initialize ' do
    context 'When argument is missing' do
      it 'Raise an error' do
        expect { described_class.new }.to raise_error(ArgumentError)
      end
    end
  end
  describe '#check_indent' do
    context 'when arguments are missing' do
      it 'Raise an error for 1 missing argument' do
        expect { subject.check_indent(20) }.to raise_error(ArgumentError)
      end
      it 'Raise an error for 2 missing argument' do
        expect { subject.check_indent }.to raise_error(ArgumentError)
      end
    end
    context 'when indentation is bigger than it supposed to be' do
      it 'Colects error in error array' do
        expect(subject.errors).to include('Error line 7: Wrong indentation'.colorize(:red))
      end
    end
  end
  describe '#check_space_trailing' do
    context 'when arguments are missing' do
      it 'Raise an error for 1 missing argument' do
        expect { subject.check_space_trailing(20) }.to raise_error(ArgumentError)
      end
      it 'Raise an error for 2 missing argument' do
        expect { subject.check_space_trailing }.to raise_error(ArgumentError)
      end
    end
    context 'when line contains space trailing' do
      it 'Colects space trailing error in error array' do
        expect(subject.errors).to include('Error line 3: White space at the end of the line'.colorize(:red))
      end
    end
  end
  describe '#check_new_lines' do
    context 'when arguments are missing' do
      it 'Raise an error for 1 missing argument' do
        expect { subject.check_new_lines(20) }.to raise_error(ArgumentError)
      end
      it 'Raise an error for 2 missing argument' do
        expect { subject.check_new_lines }.to raise_error(ArgumentError)
      end
    end
    context 'when there is 2 new lines next to each other' do
      it 'Colects new line error in error array' do
        expect(subject.errors).to include('Error line 5: New line error  '.colorize(:red))
      end
    end
  end
  describe '#check_tags' do
    context 'when arguments are missing' do
      it 'Raise an error for 1 missing argument' do
        expect { subject.check_tags(20) }.to raise_error(ArgumentError)
      end
      it 'Raise an error for 2 missing argument' do
        expect { subject.check_tags }.to raise_error(ArgumentError)
      end
    end
    context 'when there is missing a closing tag' do
      it 'tags[missing tag] gets value 1' do
        expect(subject.tags['brace']).to eql(1)
      end
    end
    context 'when there is missing a opening tag' do
      it 'tags[missing tag] gets value -1' do
        expect(subject.tags['bracket']).to eql(-1)
      end
    end
  end
  describe '#tag_error' do
    context 'when we have missing tags' do
      it 'errors array colects missing closing tag error' do
        expect(subject.errors).to include('Error: You are missing closing brace'.colorize(:red))
      end
      it 'errors array colects missing openning tag error' do
        expect(subject.errors).to include('Error: You are missing openning bracket'.colorize(:red))
      end
    end
  end
  describe '#check_variables' do
    context 'when we declare same variable multiple times' do
      it 'errors array colects multiple declaration error' do
        expect(subject.errors).to include('Error: Declaring same variable multiple times'.colorize(:red))
      end
    end
  end
end
