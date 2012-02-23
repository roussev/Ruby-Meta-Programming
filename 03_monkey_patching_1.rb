p "Reopen Class"

class Object
  def blank?
    respond_to?(:empty?) ? empty? : !self # !nil is true
  end

  def present?
    !blank?
  end
end

require 'test/unit'

class ObjectExtendTest < Test::Unit::TestCase
  def test_blank
    assert ![1,2,3].blank?
    assert !"foo".blank?
    assert "".blank?
    assert nil.blank?
    assert false.blank?
    assert !true.blank?
  end
end
# Finished in 0.000458 seconds.
# 1 tests, 6 assertions, 0 failures, 0 errors, 0 skips