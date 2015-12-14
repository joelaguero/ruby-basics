# Adds a new method to the Enumerable module, allowing a user to 
# pass a block in and execute this block on an array of strings
# converted into a hash, where the strings are grouped by their
# first letters.
module Enumerable
	def each_group_by_first_letter

		# Create a hash grouping the array's strings by their first
		# letters. We assume it will only be used on arrays of strings.
		groupings_by_first_letter = Hash.new
		self.each do |word|
			first_letter = word[0].to_s
			if groupings_by_first_letter[first_letter] != nil
				groupings_by_first_letter[first_letter] << word
			else
				groupings_by_first_letter[first_letter] = [word]
			end
		end

		# For each key/value pair in the hash, yield the first letter
		# and associated words. If there is no block, do not through an
		# error.
		groupings_by_first_letter.each_pair do |letter, words|
			yield letter, words if block_given?
		end
	end
end

# Test Code
x = ["abcd", "axyz", "able", "xyzab", "qrst"]
x.each_group_by_first_letter do |letter, words|
	printf("%s: %s\n", letter, words.join(" "))
end