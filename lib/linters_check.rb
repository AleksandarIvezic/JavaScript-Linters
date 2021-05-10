class Linter_check
    attr_reader :file, :buffer, :lines, :errors
    def initialize(path)
        @path = path
        @lines = IO.readlines(@path)
        @errors = []
        run_check     
    end

    def run_check 
        
    end

    def check_indentation
        @ind = 0
        @lines.each_with_index do |line, i|
            @line_ind= 0
            line_arr = line.split("")
            line_arr.each do |x|
                break if x!= " "
                @line_ind += 1
            end   
            if line[i-1] && line[i-1].match("{\n")
                @ind +=2
            elsif line[i-1] && line[i-1].match("}")
                @ind -=2
            end
            if @ind != @line_ind
            @errors << "Indentation error on line #{i+1}"
            end
        end
    end

        # check if there is a space before new line
    def check_space_trailing 
        @lines.each_with_index do |line, i|
            line_arr = line.split("")
            @errors << "You have white space at the end of the line #{i+1}" if line_arr[-2] == " "
        end
    end

    def check_new_lines
        @lines.each_with_index do |line, i|
            @errors << "You have new line error on the line #{i+1}" if lines[i-1] == "\n" && line == "\n"
        end
    end

    def check_tags
        @tags = {
            "curly_braces" => 0,
            "brackets" => 0,
            "braces" => 0
        }
        @lines.each_with_index do |line, i|
            line_arr = line.split("")
            line_arr.each do |char|
                if char.match("{")
                    @tags["curly_braces"] +=1 
                elsif char.match("}")
                    @tags["curly_braces"] -=1 
                elsif char.match(/\[/)
                    @tags["brackets"] +=1 
                elsif char.match(/\]/)
                    @tags["brackets"] -=1 
                elsif char.match(/\(/)
                    @tags["braces"] +=1 
                elsif char.match(/\)/)
                    @tags["braces"] -=1 
                end
            end
        end
        p @tags
        @tags.each do |key, val|
            @errors << "You are missing closing #{key}" if  val >0
            @errors << "You are missing openning #{key}" if val <0
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


varbla = Linter_check.new("js_test.js")
# buffer = StringScanner.new(varbla.lines[0])
# p buffer
varbla.check_white_spaces
# p varbla.errors