require 'pry'
# Magic Eight Ball Pseudocode:
# Basic Objectives:
# - User inputs question
# - Computer outputs random answer
# - User inputs "QUIT"
# - Computer outputs a goodbye message and exits
#
# Bonus Objectives:
# - ability to add more answers:
#   - via easter egg question ("add_answers")
#   - via script arguments (ruby magic_eight.rb add_answers)
#   - do not let them add the same answer if the eight ball already has that answer
#
# - ability to reset answers back to original bank (hint: think constants)
#   - via easter egg question ("reset_answers")
#
# - ability to have eight ball print all answers
#   - via easter egg question ("print_answers")

def ask_question
  puts "Ask a question. Any question. Type 'quit' to stop."
  @input = gets.strip.downcase
end

def give_answer
  puts @answers.sample
end

def add_answers
  if @input == "add_answers"
    puts "Sweet! How many answers would you like to add?"
    how_many = gets.to_i
    how_many.times do
      puts "Enter your answer: "
      new_answer = gets.strip
      if @answers.include? new_answer
        puts "Sorry, we already have that answer."
      else
        @answers << new_answer
        puts "Your answer has been added."
      end
    end
  end
end

@answers = ["It is certain", "It is decidedly so", "Without a doubt", "Yes, definitely",
          "You may rely on it", "As i see it, yes", "Most likely", "Outlook good",
          "Yes", "Signs point to yes", "Reply hazy try again", "Ask again later",
          "Better not tell you now", "Cannot predict now", "Concentrate and ask again",
          "Don't count on it", "My reply is no", "My sources say no",
          "Outlook not so good", "Very doubtful"]

# while something is true, run this code
# while @input != "quit"
#   ask_question
#   if @input != "quit"
#     give_answer
#   else
#     puts "Thank you for playing. Goodbye!"
#     exit
#   end
# end

def reset_answers
  @answers = ["It is certain", "It is decidedly so", "Without a doubt", "Yes, definitely",
            "You may rely on it", "As i see it, yes", "Most likely", "Outlook good",
            "Yes", "Signs point to yes", "Reply hazy try again", "Ask again later",
            "Better not tell you now", "Cannot predict now", "Concentrate and ask again",
            "Don't count on it", "My reply is no", "My sources say no",
            "Outlook not so good", "Very doubtful"]
  puts "Your answers have been reset."
end

def print_answers
  @answers.each {|answer| puts answer}
end

while @input != "quit"
  ask_question
  case @input
  when "add_answers"
    add_answers
  when "print_answers"
    print_answers
  when "reset_answers"
    reset_answers
  else
    if @input != "quit"
      give_answer
    else
      puts "Thank you for playing. Goodbye!"
      exit
    end
  end
end

add_answers
