require 'pry'
require 'pry-nav'

VALID_CHOICES = %w(r p s l sp)

def prompt(message)
  Kernel.puts("=> #{message}")
end

def choice_mapping(args)
  case args
  when 'r'
    'rock'
  when 'p'
    'paper'
  when 's'
    "scissors"
  when 'l'
    'lizard'
  when 'sp'
    'spock'
  end
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper') ||
    (first == 'scissors' && second == 'lizard') ||
    (first == 'paper' && second == 'spock') || 
    (first == 'rock' && second == 'lizard') ||
    (first == 'lizard' && second == 'spock') ||
    (first == 'lizard' && second == 'paper') ||
    (first == 'spock' && second == 'scissors') ||
    (first == 'spock' && second == 'rock')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

puts "
  *****************************************************
      Rock Paper Scissors Lizard Spock! 
  'r' for rock,'p' for paper,'s' for scissors,'l' for lizard,'sp' for spock" 

loop do
  choice ||= ''
       
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  choice = choice_mapping(choice)
  computer_choice = choice_mapping(VALID_CHOICES.sample)
  prompt("You chose #{choice} and Computer chose #{computer_choice}.")
  display_results(choice, computer_choice)

  prompt("Do you want to play again? Y or N? ")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing RPSLS. Good-bye!")
