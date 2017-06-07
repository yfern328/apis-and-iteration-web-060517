

def welcome
  # puts out a welcome message here!
  puts "Looks like you want some information about a Star Wars character..."
  puts "Let me help"
end

def get_character_from_user
  #puts "Please select a character from the following list:"
  puts "Please type in the name of a character:"
  #p all_characters
  # use gets to capture the user's input. This method should return that input, downcased.
  user_input = gets.chomp
end
