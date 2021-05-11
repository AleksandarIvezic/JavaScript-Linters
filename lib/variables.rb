require_relative "parser"
class Variables
    attr_reader :all_vars
   def initialize (file, all_vars = {})
        @all_vars = all_vars
        @file = Parser.new(file)
        @lines = @file.lines
    end

    def add_variable (name, line)
        @all_vars[line] = name if name
    end

    def create_variables
        @lines.each_with_index do |line, idx|
            arr = line.split(' ')
            arr.each_with_index do |word, indx|
                if word.match(/const|var|let/) 
                    add_variable(arr[indx + 1], idx+1) 
                end
            end
        end
    end

    def repeats?
        values = []
        @all_vars.each_value do |val|
            values << val
        end
        values.uniq.length == values.length
    end
    
end
