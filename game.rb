class ComputerGuessing

  attr_accessor :tries,
                :floor,
                :ceiling

  def initialize
    self.tries = 0
    self.floor = 0
    self.ceiling = 1000
  end

  def play
    puts "Pick a number between 1 and 1000."
    puts "I'll guess a number and you tell me if it's high or low."
    puts "Have a number? [press any key]"
    gets
    guess
  end

  def possibilities
    (floor..ceiling).to_a
  end

  def middle_of_range
    possibilities[possibilities.length/2]
  end

  def bullshit?(response)
    if possibilities.length == 1 && %w(h l).include?(response)
      puts "It can only be #{middle_of_range}"
    end
  end

  def guess
    this_guess = middle_of_range
    puts "My guess is #{this_guess}."
    puts "Am I high(h), low(l), or just right(y)"
    response = gets.chomp.downcase
    if response == "h"
      self.ceiling = this_guess
      guess
    elsif response == "l"
      self.floor = this_guess
      guess
    elsif response == "y"
      puts "We did it!"
    else
      puts "That wasn't an option."
      guess
    end
  end
