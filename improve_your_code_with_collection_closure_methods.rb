# Improve your code with collection closure methods.

# When working with collections of data we often need to iterate over (or traverse)
# one collection, do something with each element, and gather the results. You might
# find that the code below looks familiar.

brainless = []

zombies.each do |zombie|
  brainless << zombie if zombie.brainless?
end

# Above we create an empty array and assign it to the variable 'brainless'
# Assuming that we already have a collection of zombies we iterate
# over them adding each one to the brainless array if it is brainless.


# Code structures similar to this one are so common that Ruby actually has built-in
# support to help you acheive the same effect with less code.
