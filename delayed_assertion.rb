class DelayedAssertion
  include Assertions

  def initialize(subject)
    @subject = subject
  end
end
