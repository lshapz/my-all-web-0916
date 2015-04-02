---
tags: logic, cs, monkey patching, todo, custom methods
languages: ruby
resources: 1
---

# My All?

## Objective

You will be building out Ruby's `#all?` method. You'll be adding an method to the the Enumerable module to accomplish this.

## About all

Since Ruby's `all?` method is part of the Enumerable module, it can be called on hashes, arrays, ranges, etc. 

It takes a block and returns either true or false. It returns true if every element when yeilded to the block evaluates to true. It returns false if not every element, when yeilded to the block, returns true.

```ruby
animals = ["ant", "bear", "cat"]
animals.all? { |word| word.length >= 3 } 
#=> true

animals.all? { |word| word.length >= 4 } 
#=> false
```

If the block is not given, Ruby adds an implicit block of `{ |obj| obj }` which will cause `#all?` to return true when none of the collection members are false or nil.

This is how your `#my_all?` method should behave (it is also how Ruby's `#all?` behaves):

```ruby
[true, true, true].my_all?
#=> true

[1,2,3].my_all?
#=> true

[true, false, true].my_all?
#=> false

[nil, true, 99].my_all?
#=> false
```

## Notes

You may not call on Ruby's `#all?` method to accomplish this task. While you should not change the object that `#all` is called on, you will not need to use `#clone` to accomplish this.

## Resources

* [Ruby's all Method](http://ruby-doc.org/core-2.2.1/Enumerable.html#method-i-all-3F)
