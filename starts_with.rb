# Takes an array of strings, a string, and a block as parameters.
# For each string in the array, if executes the block on the string
# if the first letters of the string in the array match the string.
def each_starts_with (array, string, &block)
	array.each { |x|
		if x.index(string) == 0 then yield(x) end
	}
end

# Test Code
array1 = ["apple", "banana", "APE", "bAnk", "Bad", "apricot", "banjo"]
each_starts_with(array1, "ap") { |x| puts x }
