Improve Your Code With Collection Closure Methods

When working with collections of data we often need to iterate over (or traverse)
one collection, do something with each element, and gather the results. You might
find the code below familiar.

zombie_names = []

zombies.each do |zombie|
  zombie_names << zombie.name
end

Here we want all of the zombies names so we create an empty array
and assign it to the variable 'zombie_names'
Assuming that we already have a collection of zombies, we iterate
over them adding each zombie's name to the zombie_names array.

Code patterns similar to this one are so common that Ruby actually has built-in
support to help you acheive the same effect with less code. Check out Enumerable.
(http://ruby-doc.org/core-1.9.3/Enumerable.html) One example of a method
Enumerable gives us is .map. (http://ruby-doc.org/core-1.9.3/Enumerable.html#method-i-map)
Map takes a block and returns a new array containing the results of calling that block
once for every element in the collection. Let's look at an example.

collection = [1, 2, 3]

collection.map do |element|
  element * 5
end

=> [5, 10, 15]

Now how does this differ from the .each method? As we saw above .map returns the
result of calling the block once for each element in the collection. The .each
method calls the block once for each element in the collection but then returns
the original collection.

Know that we know a bit about .map let's look at how it can help us clean up
our code. We started off with this.

zombie_names = []

zombies.each do |zombie|
  zombie_names << zombie.name
end

But now let's use .map instead of .each.

zombie_names = zombies.map do |zombie|
  zombie.name
end

.map creates the new array for us, which is nice, but this looks a bit weird
now so let's switch to using the curly brace block syntax

zombie_names = zombies.map { |zombie| zombie.name }

Better. But we can improve it still by using a sortcut syntax for passing
the block to map

zombie_names = zombies.map(&name)

A lot less code then when we started, and still the same result.

We've talked about how Enumerable methods like .map can help us
write clean succinct code, but what I haven't told you is that
this is actually a popular refactoring technique called
replace loop with collection closure method. Let's look at
a few more examples of the technique.

brainless = []

zombies.each do |zombie|
  brainless << zombie if zombie.brainless?
end

This time we iterate over zombies adding each one to the brainless
array if it is brainless.
Again, so common that Enumerable gives us a method to do just that.

brainless = zombies.select { |zombie| zombie.brainless? }

.select will return an array containing each element for which the
block returned true.

What if we wanted to do the opposite?

brainy = []

zombies.each do |zombie|
  brainy << zombie unless zombie.brainless?
end

.reject is what we want here. It's essentially the opposite of
.select

brainy = zombies.reject { |zombie| zombie.brainless? }

Let's look at one more example before we wrap this up.
Suppose you have a collection of zombies and need to know
the total amount of limbs in the collection. One way to
do it would be:

limbs = 0

zombies.each do |zombie|
  limbs += zombie.limbs
end

But of course Enumerable has a handy .inject method.

limbs = zombies.inject(0) { |sum, zombie| sum + zombie.limbs }

.inject is powerful and can do a lot more than just this. But
all you need to know to get started using it is that the parameter
you pass it will be used as the starting value and will be passed
to the block as the first block parameter.
