def welcome
  # puts out a welcome message here!
  puts "Hi there! Get your Star Wars information here!"
end

def get_character_from_user
  puts "Enter the name of the character you would like to know about:"
  # use gets to capture the user's input. This method should return that input, downcased.
  gets.chomp.downcase
end
