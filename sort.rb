# Accepts an array and outputs the array's elements, sorted. Can be
# combined with other functions to change the method of sorting.
def funny_sort(array)
	puts array.sort{ |a, b| findEarliestDigits(a) <=> findEarliestDigits(b) }
end

# Returns the earliest digits in a string in the form of an integer.
# If there are no digits in the string, then the function returns 
# a value of -1.
def findEarliestDigits(string)
	
	# Find the earliest string of continue digits in the string.
	earliestDigits = string.match('\d+').to_s.to_i

	# If there are no digits in the string, return -1.
	if earliestDigits == nil then earliestDigits = -1 end

	return earliestDigits
end

# Test Code
array1 = ["-100x500", "abc99.6", "12345", ".....", "   5fi.3s0.xj9"]
array2 = ["JVTdjhwXeY", "DnL6fVg3Aj", "pTs9bdLVS3", "GVv6H8KtQV", "EibaV2IbZ5"]
array3 = [" ", "", "OoVVS2ruZU", "x-1---2", "i6-8zxaM1ZA"]
funny_sort(array1)
funny_sort(array2)
funny_sort(array3)