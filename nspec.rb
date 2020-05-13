require 'pry'

def describe(description, &block)
  ExampleGroup.new(block).evaluate!
end

class ExampleGroup
  def initialize(block)
    @block = block
  end

  def evaluate!
    # instance_eval allows us to call 'it' within the context of ExampleGroup
    instance_eval(&@block)
  end

  def it(description, &block)
    block.call
  end
end

class Object
  # Reopening object lets us call should on anything
  def should(comparison_object=nil)
    if comparison_object
      comparison_object.call
    else
      DelayedAssertion.new(self)
    end
  end
end

module Assertions
  def ==(other)
    raise AssertionError unless @subject == other
  end
end

class DelayedAssertion
  include Assertions

  def initialize(subject)
    @subject = subject
  end
end

class AssertionError < Exception
end
