# Improve your code with collection closure methods.

# When working with collections of data we often need to iterate over (or traverse)
# one collection, do something with each element, and gather the results. You might
# find that the code below looks familiar.

zombie_names = []

zombies.each do |zombie|
  zombie_names << zombie.name
end

# Here we want all of the names of the zombies so we iterate over our collection
# of zombies and add each name to the zombie_names array.

# Code patterns similar to this one are so common that Ruby actually has built-in
# support to help you acheive the same effect with less code. Check out Enumerable.
# (http://ruby-doc.org/core-1.9.3/Enumerable.html) One example of a method
# Enumerable gives us is map. (http://ruby-doc.org/core-1.9.3/Enumerable.html#method-i-map)
# Map takes a block and returns a new array containing the results of calling that block
# once for every element in the original collection. Let's look at an example.

collection = [1, 2, 3]

collection.map do |element|
  element * 5
end
# => [5, 10, 15]

# Now how does this differ from the .each method? As we saw above .map returns the
# result of calling the block once for each element in the collection. The .each
# method calls the block once for each element in the collection but then returns
# the original collection.

# Know that we know a bit about .map let's look at how it can help us clean up
# our code. We started off with this.

zombie_names = []

zombies.each do |zombie|
  zombie_names << zombie.name
end

# But now let's use .map instead of .each.

zombie_names = zombies.map do |zombie|
  zombie.name
end

# .map creates the new array for us, which is nice, but this looks a bit weird
# now so let's switch to using the curly brace block syntax

zombie_names = zombies.map { |zombie| zombie.name }

# Better. But we can make it even more
# succinct by using a sortcut syntax when passing the block to map

zombie_names = zombies.map(&name)

# A lot less code then when we started, and still the same result.

# We've talked about how Enumerable methods like .map can help us
# write clean succinct code, but what I haven't told you is that
# this is actually a popular refactoring technique called
# replace loop with collection closure method.

brainless = []

zombies.each do |zombie|
  brainless << zombie if zombie.brainless?
end

# Above we create an empty array and assign it to the variable 'brainless'
# Assuming that we already have a collection of zombies, we iterate
# over them adding each one to the brainless array if it is brainless.

