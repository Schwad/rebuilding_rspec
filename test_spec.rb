require 'test/unit'
require_relative 'nspec'

class TestDescribe < Test::Unit::TestCase
  def test_that_it_can_pass
    describe 'some thing' do
      it 'has some property' do
      end
    end
  end

  def test_that_it_can_fail
    assert_raise(IndexError) do
      describe 'failure' do
        it 'fails' do
          raise IndexError
        end
      end
    end
  end
end

class TestAssertion < Test::Unit::TestCase

  def test_that_it_can_pass
    2.should == 2
  end

  def test_that_it_can_fail
    assert_raise(AssertionError) do
      1.should == 2
    end
  end
end
#
# class AllAssertions < Test::Unit::TestCase
#
#   def test_be_true_be_false
#     true.should be_true
#     false.should be_false
#     assert_raise(AssertionError) do
#       false.should be_true
#     end
#   end
#
# end
