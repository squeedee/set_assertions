# -*- encoding: utf-8 -*-
require "set_assertions/version"

module SetAssertions

  ##
  # Passes if +expected_set+ and +actual_set+ are equal sets.
  # An equal set has the following properties.
  #   * Identical cardinality.
  #   * The same elements, without concern for order.
  #
  # Example:
  #   assert_equal_set [:a,:b], [:b,:a]

  def assert_equal_set(expected, actual, message=nil)
    full_message = build_message(message, "set <?> in any order was expected, got: \n<?>.\n", expected, actual)
    assert_block(full_message) {
      (expected.length == actual.length) &&
        ((expected & actual).length == actual.length)
    }
  end

  ##
  # Passes if +expected_set+ and +actual_set+ are inequal sets.
  # An inequal set has the following properties.
  #   * Different cardinality.
  #   * The same cardinality, but different elements. (order does not matter)
  #
  # Example:
  #   assert_not_equal_set [:a,:b], [:a,:c]

  def assert_not_equal_set(expected, actual, message=nil)
    full_message = build_message(message, "any set other than <?> was expected, got the same: \n<?>.\n", expected, actual)
    assert_block(full_message) {
      (expected.length != actual.length) ||
        ((expected & actual).length != actual.length)
    }
  end

end

class Test::Unit::TestCase
  include SetAssertions
end