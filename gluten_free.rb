#Title: Gluten Free
 
#Prerequisites:
#- Ruby
#    - Exceptions
#    - Hashes & Arrays
#    - Objects & Classes
 
#Objectives:
#- Work with exceptions, classes, class variables, conditions
 
"======================================================================"
 
# Create a Person class. A person will have a stomach and allergies
# Create a method that allows the person to eat and add arrays of food to their stomachs
# If a food array contains a known allergy reject the food.
 
class AllergicError < ArgumentError

end

class Person

	def initialize(allergies)
		@allergies = allergies
		puts "I am allergic to #{@allergies}."
	end

	def eat(food)
		@food = food
		self.stomach
	end

	def stomach
	  begin
		if @food.include?(@allergies)
			raise AllergicError.new("Allergy Error: I got sick because there was #{@allergies}!")
	     else
			puts "That was so yummmmmmmmmmmmmy!"
		end
	  rescue AllergicError => e
			puts "#{e}"
	  end
	end

end
 
# Create a Person named Chris. Chris is allergic to gluten.
# Create a Person named Beth. Beth is allergic to scallops.
# Feed them the following foods
 
pizza = ["cheese", "gluten", "tomatoes"]
pan_seared_scallops = ["scallops", "lemons", "pasta", "olive oil"]
water = ["h", "h", "o"]

chris = Person.new("gluten")
chris.eat(pizza)
chris.eat(pan_seared_scallops)
chris.eat(water)
puts
beth = Person.new("scallops")
beth.eat(pizza)
beth.eat(pan_seared_scallops)
beth.eat(water)
 
# When a person attempts to eat a food they are allergic to, raise a custom exception
# For example:  AllergyError
 
 
# Bonus: When a person attempts to eat a food they are allergic to,
#        ... remove ALL the food from the person's stomach before raising the exception