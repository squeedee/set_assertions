# -*- encoding: utf-8 -*-

require 'test/unit'
require 'set_assertions'

class SetAssertionsTest < Test::Unit::TestCase
  def test_two_empty_tests_pass
    assert_identical_set([], [])
  end

  def test_two_identical_unit_sets_pass
    assert_identical_set([:a], [:a])
  end

  def test_an_empty_set_and_a_unit_set_fail
    assert_fail_assertion { assert_identical_set([:a], []) }
    assert_fail_assertion { assert_identical_set([], [:a]) }
  end

  def test_order_does_not_matter
    assert_identical_set([:a, :b], [:b, :a])
  end

  def test_same_cardinality_but_different_set_fails
    assert_fail_assertion { assert_identical_set([:a, :b], [:c, :b]) }
  end

  def test_large_cardinality_passes
    assert_identical_set([:a, :b, "c", 4, "f", :g, :h], [:a, :b, "c", 4, "f", :g, :h])
  end

  def test_object_equality_passes
    a = "foo"
    b = {:foo => "bar"}
    assert_identical_set([a,b], [b,a])
  end
end