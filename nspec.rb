require 'pry'
require_relative "assertions"
require_relative "delayed_assertion"
require_relative "errors"

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
  def should
    DelayedAssertion.new(self)
  end
end
