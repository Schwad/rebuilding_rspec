module Assertions
  def ==(other)
    raise AssertionError unless @subject == other
  end
end
