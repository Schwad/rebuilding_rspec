module Assertions
  def ==(other)
    unless @subject == other
      raise AssertionError.new(
        "Expected #{@subject.inspect} but got #{other.inspect}"
      )
    end
  end
end
