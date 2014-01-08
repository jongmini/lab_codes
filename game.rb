cook_on = true
history = []
while cook_on

pages_with_questions = {}

lines_grabbed = ""
key = ""

File.open("story.txt", "r") do |infile|
  while (line = infile.gets)
       if line.index("~p")
       	key = line.chomp
       	lines_grabbed = ""
       else
       	lines_grabbed += line
       end 
       pages_with_questions[key] = lines_grabbed
   end
end

# puts pages_with_questions["~p1"]

p1 = pages_with_questions.select { |k,v| k.index("~p1") }

i = 1

p1.each do |k,v| 
	if k.match /^~p\d$/
		puts v
	else
	puts "#{i}. #{v}"
	i += 1
	end
end

puts "please enter your choice."
choice = gets.to_i + 1

history.push("~p#{choice}")

breakfast = pages_with_questions.select { |k,v| k.index("~p#{choice}") }

puts breakfast.values[0]

puts "do you want to eat again? (yes/no)"
eat_more = gets.chomp.downcase
  if eat_more == "yes"
	cook_on = true
  elsif eat_more == "no"
	cook_on = false
  end
end

puts history

# history.each { |x| puts pages_with_questions[x] }

# pages_with_questions = {}
# i = 1

# File.open("story.txt", "r") do |infile|
#   while (line = infile.gets)
#       # if line.match /^~p\d$/
#       #   pages_with_questions[line] = "this is page text"
#      # if line.match /^~p\d:c\d:p\d$/
#        if line.match /^~p\d*/
#        # pages_with_questions[line] = IO.readlines("story.txt")[i]
#        pages_with_questions[line] = "".concat(IO.readlines("story.txt")[i])
#      end
#      i += 1
#    end
#  end

# puts pages_with_questions

# pages_with_questions = {}

# File.open("story.txt", "r") do |infile|
#   while (line = infile.gets)
#   	if line.match /^~p\d:c\d:p\d$/
#   		pages_with_questions[line] = "this is a test"
#   	end
#   end
# end

# IO.readlines("story.txt")[10]