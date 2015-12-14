# Adds a new method for squaring a number to the Numeric class.
class Numeric
	def squared 
		return result = self*self
	end
end

# Test Code
puts 9.squared
puts 16.squared