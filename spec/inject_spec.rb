require 'inject'

describe 'injection' do
	
	let(:two_element_array) {[1, 2]}
	context 'given a specified memo value' do
       
	      it 'accepts a block, returning the newly injected memo value' do
	      	# if the array element is inlcluded in the memo then it puts array element
	      	# else it assigns the array element to the memo
	        expect(two_element_array.injection([2, 3, 4]) { |memo, array_element| memo.include?(array_element) ? memo : memo << array_element }).to eq [2, 3, 4, 1]
	      end
     end

    context 'argument  must be a symbol' do

		it 'raise a TypeError if the single argument is not a symbol' do
     			expect(lambda { array.injection(2) }).to raise_error(TypeError)
     	end

    end

	context 'injection of two numbers' do
		

		it 'takes two numbers' do
			expect(two_element_array.injection).to eq 1
		end

		context 'binary oerations' do
			it 'adds two numbers' do
				expect(two_element_array.inject(:+)).to eq 3
			end

			it 'subtracts two numbers' do
				expect(two_element_array.inject(:-)).to eq -1
			end

			it 'mulitplies two numbers' do
				expect(two_element_array.inject(:*)).to eq 2
			end

			it 'divides two numbers' do
				expect(two_element_array.inject(:/)).to eq 0
			end
		end

	end
 
	let(:array) { [1,2,3] }

     context 'arrays with more than 2 elements' do

	     context 'binary operations' do

	     		it 'add values' do
	     			expect(array.injection(2, :+)).to eq 8
	     		end

	     		it 'subtract values' do
	     			expect(array.injection(12, :-)).to eq 6
	     		end

	     		it 'multiply values' do
	     			expect(array.injection(3, :*)).to eq 18
	     		end

	     		it 'divide values' do
	     			expect(array.injection(12, :/)).to eq 2
	     		end

	     end

	     context 'there is not a specified memo value' do
	     		
	     		it 'return the newly injected memo value when using a block' do
	     			
	     			expect(array.injection {|memo, array_element| memo > array_element ? memo : array_element}).to eq 3
	     		end

	     		context 'binary operations' do

	     			it 'add values' do
	     				expect(array.injection(:+)).to eq 6
	     			end

	     			it 'subtract values' do
	     				expect(array.injection(:-)).to eq -4
	     			end

	     			it 'multiply values' do
	     				expect(array.injection(:*)).to eq 6
	     			end

	     			it 'divide values' do
	     				expect(array.injection(:/)).to eq 0
	     			end

	     		end
	     end
 	end

 	context 'with an array of strings' do

 		let(:string_array) { ['dog', 'horse', 'bear'] }
 		
 		it 'selects the longest word from an array' do
 			expect(string_array.injection {|memo, word| memo.length > word.length ? memo : word }).to eq 'horse'
 		end
 	end
 end

