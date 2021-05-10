class Linter_check
    attr_reader :file, :buffer, :lines
    def initialize(path)
        @path = path
        @lines = IO.readlines(@path)
        run_check     
    end

    def run_check 

    end
end   


varbla = Linter_check.new("js_test.js")
p varbla.lines[0]