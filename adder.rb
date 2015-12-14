# This class creates a new Adder class, which uses metaprogramming
# to create new methods for adding positive integers on the fly. It
# also introduces a method_missing method that reports appropriate
# errors if a user tries to create a method other than the allowable
# "plus" method.
class Adder

	def initialize(input)
		@int = input
	end

	# Method containing the meta-programming aspects. Create the plus
	# method and handles errors upon other input.
	def method_missing(name, *args)

		# Parse the input to separate the method name from the number.
		method = name.slice(/\D+/)
		number = name.slice(/\d+/).to_i

		# If the method follows the form "plus" + positive_integer then
		# add a new method to the Adder class. Otherwise, throw the
		# appropriate error.
		if method == "plus" and number > 0 then
			positive_int = number
			Adder.class_eval do
				define_method "#{name}" do
					@int + positive_int
				end				
			end
			eval name.to_s
		else
			super
		end

	end

end