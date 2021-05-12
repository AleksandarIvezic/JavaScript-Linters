class Parser
  attr_reader :path, :lines

  def initialize(path)
    @path = path
    @lines = IO.readlines(@path)
  end
end
