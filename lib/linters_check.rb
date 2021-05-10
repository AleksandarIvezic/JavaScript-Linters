# require_relative "indentation"
require_relative 'parser'
class LinterCheck
  attr_reader :file, :buffer, :lines, :errors

  def initialize(path)
    @path = path
    @file = Parser.new(@path)
    @lines = @file.lines
    @errors = []
    @ind = 0
    @tags = {
      'curly_braces' => 0,
      'brackets' => 0,
      'braces' => 0
    }
    run_check
  end

  def run_check
    @lines.each_with_index do |line, i|
      check_indent(line, i)
      check_new_lines(line, i)
      check_space_trailing(line, i)
      check_tags(line, i)
    end
    tag_error
  end

  def check_indent(line, idx)
    @line_ind = 0
    line_arr = line.split('')
    line_arr.each do |x|
      break if x != ' '

      @line_ind += 1
    end
    case line[idx - 1]
    when '{\n' then @ind += 2
    when '}' then @ind += 2
    end
    @errors << "Indentation error on line #{idx + 1}" if @ind != @line_ind
  end

  # check if there is a space before new line
  def check_space_trailing(line, idx)
    # @lines.each_with_index do |line, i|
    line_arr = line.split('')
    @errors << "You have white space at the end of the line #{idx + 1}" if line_arr[-2] == ' '
    # end
  end

  def check_new_lines(line, idx)
    # @lines.each_with_index do |line, i|
    @errors << "You have new line error on the line #{idx + 1}" if lines[idx - 1] == "\n" && line == "\n"
    # end
  end

  def check_tags(line, _idx)
    line.split('').each do |char|
      case char
      when '{' then @tags['curly_braces'] += 1
      when '}' then @tags['curly_braces'] -= 1
      when '[' then @tags['brackets'] += 1
      when ']' then @tags['brackets'] -= 1
      when '(' then @tags['braces'] += 1
      when ')' then @tags['braces'] -= 1
      end
    end
  end

  def tag_error
    @tags.each do |key, val|
      @errors << "You are missing closing #{key}" if val.positive?
      @errors << "You are missing openning #{key}" if val.negative?
    end
  end

  # def check_white_spaces
  #     @lines.each_with_index do |line, i|
  #         line_arr = line.split("")
  #         @error_regexp = /^\w+[\s\s]$/
  #             puts "matching #{i+1}" if @error_regexp.match(line)
  #         line_arr.each do |char|

  #         end
  #     end
  # end
end
