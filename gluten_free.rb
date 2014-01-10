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
 
# I'm setting my AllergicError
class AllergicError < ArgumentError

end

class Person

# instance takes the type of allergy and sets the stomach to an empty array and yum to true
	def initialize(allergies, stomach=[], yum = true)
		@allergies = allergies
		@stomach = stomach
		@yum = yum
		puts "I am allergic to #{@allergies}."
	end

# when eat is called, take the food array and invokes digest
	def eat(food)
		@food = food
		self.digest
	end

# if food item includes the allergy then raise an error
	def digest
	  begin
		if @food.include?(@allergies)
			@yum = false
			raise AllergicError.new("Allergy Error: I got sick because there was #{@allergies}!")
	     else
# if the food item contains no allergies then keep on eating!
			puts "That was so yummmmmmmmmmmmmy!"
			@yum = true
		end
# rescue saves the error message and prints it here
	  rescue AllergicError => e
			puts "#{e}"
	  end
	end

# stomach method returns what's in the stomach
	def stomach
		if @yum == true
		  @stomach << @food
		  puts "I've eaten #{@stomach.join(",")}"
		else 
# if yum is not true then the stomach array gets reset to empty
		  @stomach =[]
		  puts "I threw up!"
		end
		  
	end


	# end


end
 
# Create a Person named Chris. Chris is allergic to gluten.
# Create a Person named Beth. Beth is allergic to scallops.
# Feed them the following foods
 
pizza = ["cheese", "gluten", "tomatoes"]
pan_seared_scallops = ["scallops", "lemons", "pasta", "olive oil"]
water = ["h", "h", "o"]

chris = Person.new("gluten")
chris.eat(water)
chris.stomach
chris.eat(pan_seared_scallops)
chris.stomach
chris.eat(pizza)
chris.stomach
puts
beth = Person.new("scallops")
beth.eat(pizza)
beth.stomach
beth.eat(water)
beth.stomach
beth.eat(pan_seared_scallops)
beth.stomach
 
# When a person attempts to eat a food they are allergic to, raise a custom exception
# For example:  AllergyError
 
 
# Bonus: When a person attempts to eat a food they are allergic to,
#        ... remove ALL the food from the person's stomach before raising the exception