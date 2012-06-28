# -*- encoding: utf-8 -*-

require 'test/unit'
require 'set_assertions'

class SetAssertionsTest < Test::Unit::TestCase
  def test_two_empty_tests_pass
    assert_identical_set([],[])
  end

  def test_two_identical_unit_sets_pass
    assert_identical_set([:a],[:a])
  end

  def test_an_empty_set_and_a_unit_set_fail
    assert_identical_set([:a],[])
  end

end