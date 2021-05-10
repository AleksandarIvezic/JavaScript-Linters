require_relative 'parser'
class Indentation
  attr_reader :ind

  def initialize(ind = 0)
    @ind = ind
  end
end
