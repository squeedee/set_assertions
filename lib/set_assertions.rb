# -*- encoding: utf-8 -*-
require "set_assertions/version"

module SetAssertions
  def assert_equal_set(expected, actual, message=nil)
    full_message = build_message(message, "array with <?> in any order was expected, got: \n<?>.\n", expected, actual)
    assert_block(full_message) {
      (expected.length == actual.length) &&
        ((expected & actual).length == actual.length)
    }
  end
end

class Test::Unit::TestCase
  include SetAssertions
end