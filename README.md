## SetAssertions

At the moment, the only test this gem provides is: assert_equal_set

This checks that, despite order, two arrays contain the same scalars and object references.

Why this assertion?

Because invariable I want to check that a set of values was added to a collection, but not need to know the order of them.

If you've ever had a fault like:

  Expected [:a,:b] but got [:b,:a]

... then you know what I mean.

## Further Assertions

Want more? fork, add, make pull request OR add a ticket for it and I'll add it :D