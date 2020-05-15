require 'pry'
require_relative "assertions"
require_relative "comparison_assertion"
require_relative "errors"

GREEN = "\e[32m"
RED = "\e[31m"
RESET = "\e[0m"

# Watch 'an editor from scratch'

def describe(description, &block)
  puts description
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
    begin
      print "  - #{description}"
      block.call
      puts "#{GREEN} (✓)#{RESET}"
    rescue Exception => e
      puts "#{RED} (✖)#{RESET}"
      puts e.message
      puts e.backtrace
    end
  end
end

class Object
  # Reopening object lets us call should on anything
  def should
    ComparisonAssertion.new(self)
  end
end
