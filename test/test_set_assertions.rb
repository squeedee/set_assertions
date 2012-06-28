# -*- encoding: utf-8 -*-

require 'test/unit'
require 'set_assertions'

class SetAssertionsTest < Test::Unit::TestCase

  class EqualSetTest < Test::Unit::TestCase
    def test_two_empty_tests_pass
      assert_equal_set([], [])
    end

    def test_two_identical_unit_sets_pass
      assert_equal_set([:a], [:a])
    end

    def test_an_empty_set_and_a_unit_set_fail
      assert_fail_assertion { assert_equal_set([:a], []) }
      assert_fail_assertion { assert_equal_set([], [:a]) }
    end

    def test_order_does_not_matter
      assert_equal_set([:a, :b], [:b, :a])
    end

    def test_same_cardinality_but_different_set_fails
      assert_fail_assertion { assert_equal_set([:a, :b], [:c, :b]) }
    end

    def test_large_cardinality_passes
      assert_equal_set([:a, :b, "c", 4, "f", :g, :h], [:a, :b, "c", 4, "f", :g, :h])
    end

    def test_object_equality_passes
      a = "foo"
      b = {:foo => "bar"}
      assert_equal_set([a, b], [b, a])
    end
  end

  class NotEqualSetTest < Test::Unit::TestCase
    def test_two_empty_tests_fail
      assert_fail_assertion { assert_not_equal_set([], []) }
    end

    def test_two_identical_unit_sets_fail
      assert_fail_assertion { assert_not_equal_set([:a], [:a]) }
    end

    def test_an_empty_set_and_a_unit_set_pass
      assert_not_equal_set([:a], [])
      assert_not_equal_set([], [:a])
    end

    def test_same_cardinality_but_different_set_passes
      assert_not_equal_set([:a, :b], [:c, :b])
    end

    def test_object_equality_fails
      a = "foo"
      b = {:foo => "bar"}
      assert_fail_assertion { assert_not_equal_set([a, b], [b, a]) }
    end
  end
end