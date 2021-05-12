require 'colorize'
require_relative 'variables'
require_relative 'parser'
class LinterCheck
  attr_reader :file, :lines, :errors, :tags

  def initialize(path)
    @path = path
    @file = Parser.new(@path)
    @lines = @file.lines
    @variables = Variables.new(@path)
    @errors = []
    @ind = 0
    @tags = {
      'brace' => 0,
      'bracket' => 0,
      'parentheses' => 0
    }
    run_check
  end

  def check_indent(line, idx)
    @line_ind = 0
    line.split('').each do |x|
      break if x != ' '

      @line_ind += 1
    end
    @ind += 2 if @lines[idx - 1]&.match("{\n")
    @ind -= 2 if @lines[idx].match('}')

    error_msg = "Error line #{idx + 1}: Wrong indentation".colorize(:red)
    @errors << error_msg if @ind != @line_ind
  end

  def check_space_trailing(line, idx)
    line_arr = line.split('')
    error_msg = "Error line #{idx + 1}: White space at the end of the line".colorize(:red)
    @errors << error_msg if line_arr[-2] == ' '
  end

  def check_new_lines(line, idx)
    error_msg = "Error line #{idx + 1}: New line error  ".colorize(:red)
    @errors << error_msg if lines[idx - 1] == "\n" && line == "\n"
  end

  # rubocop: disable Metrics/CyclomaticComplexity
  def check_tags(line, _idx)
    line.split('').each do |char|
      case char
      when '{' then @tags['brace'] += 1
      when '}' then @tags['brace'] -= 1
      when '[' then @tags['bracket'] += 1
      when ']' then @tags['bracket'] -= 1
      when '(' then @tags['parentheses'] += 1
      when ')' then @tags['parentheses'] -= 1
      end
    end
  end

  # rubocop: enable Metrics/CyclomaticComplexity

  def check_variables
    error_msg = 'Error: Declaring same variable multiple times'.colorize(:red)
    @errors << error_msg if @variables.repeats?
  end

  private

  def tag_error
    @tags.each do |key, val|
      @errors << "Error: You are missing closing #{key}".colorize(:red) if val.positive?
      @errors << "Error: You are missing openning #{key}".colorize(:red) if val.negative?
    end
  end

  def run_check
    @lines.each_with_index do |line, i|
      check_indent(line, i)
      check_new_lines(line, i)
      check_space_trailing(line, i)
      check_tags(line, i)
    end
    tag_error
    check_variables
  end
end
