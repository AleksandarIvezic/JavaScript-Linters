class Parser
  attr_reader :path, :lines, :line_arr
  attr_accessor :line_to_arr

  def initialize(path)
    @path = path
    @lines = IO.readlines(@path)
  end
end
