#Injection - rewriting inject


The challenge set was to rewrite the inject method.
This will be test driven.
It will assume that inject is only an Array class method, as opposed to an Enumerator method.
To avoid rspec test fails this new method will be names injection.



###This is how the inject method works

Combines all elements of enum by applying a binary operation, specified by a block or a symbol that names a method or operator.

If you specify a block, then for each element in enum the block is passed an accumulator value (memo) and the element. If you specify a symbol instead, then each element in the collection will be passed to the named method of memo. In either case, the result becomes the new value for memo. At the end of the iteration, the final value of memo is the return value for the method.

If you do not explicitly specify an initial value for memo, then the first element of collection is used as the initial value of memo.	
	
	inject(initial, sym) → obj 

	inject(sym) → obj

	inject(initial) { |memo, obj| block } → obj

	inject { |memo, obj| block } → obj




Sum some numbers

	(5..10).reduce(:+)                             #=> 45

Same using a block and inject

	(5..10).inject { |sum, n| sum + n }            #=> 45

Multiply some numbers

	(5..10).reduce(1, :*)                          #=> 151200

Same using a block

	(5..10).inject(1) { |product, n| product * n } #=> 151200

Find the longest word

	longest = %w{ cat sheep bear }.inject do |memo, word|
	   memo.length > word.length ? memo : word
	end
	longest                                        #=> "sheep"
