# Creates a method that filters an array of numbers based on a hash
# defining various filters. Valid filter options are:
# :min (int), :max (int), :odd (1 or 0), :even (1 or 0), :scale (int)
# The method also requires a block, which is executed on each number
# that fits all of the filter criteria.
def filter numbers, filters, &block
	numbers.each do |n|

		# Skip n if it's is below the minimum or above the maximum,
		# if such filters are defined.
		if 	( filters[:min] != nil and filters[:min] > n ) or
			( filters[:max] != nil and filters[:max] < n ) then
				next

		# Skip n if the odd filter is defined and n is an odd number.
		elsif ( filters[:odd] != nil ) and ( n%2 != 1 ) then
				next

		# Skip n if the even filter is defined and n is an even number.
		elsif ( filters[:even] != nil ) and ( n%2 != 0 ) then
				next

		# Multiply n by the scaler if a scaler was defined.
		elsif ( filters[:scale] != nil ) then
				n = filters[:scale]*n;
		end

		# Execute the block if it was received.
		yield(n)
	end
end

# Test Code
nums = [6, -5, 319, 400, 18, 94, 11]
filter(nums, :min => 10, :max => 350, :odd => 1, :scale => 2) {|n| puts n}