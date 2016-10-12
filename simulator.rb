require_relative "game"

class Simulator < Game

  attr_accessor :computer1,
                :computer2,
                :rock_wins,
                :paper_wins,
                :scissors_wins,
                :draw_count

  def initialize
    self.rock_wins = 0
    self.paper_wins = 0
    self.scissors_wins = 0
    self.draw_count = 0
  end

  def play
    self.computer1 = selection.upcase
    self.computer2 = selection.upcase
    match = [computer1, computer2]
    results(match)
  end

  def selection
    %w(rock paper scissors).sample
  end

  def results(match)
  results = {}
  results[:winning] = ["ROCK", "SCISSORS"], ["PAPER", "ROCK"], ["SCISSORS", "PAPER"]
  results[:losing] = ["SCISSORS", "ROCK"], ["ROCK", "PAPER"], ["PAPER", "SCISSORS"]
  results[:draw] = ["ROCK", "ROCK"], ["PAPER", "PAPER"], ["SCISSORS", "SCISSORS"]
    if results[:winning].include?(match)
      if match[0] == "ROCK"
        self.rock_wins += 1
      elsif match[0] == "PAPER"
        self.paper_wins += 1
      elsif match[0] =="SCISSORS"
        self.scissors_wins += 1
      end
    elsif results[:losing].include?(match)
      if match[1] == "ROCK"
        self.rock_wins += 1
      elsif match[1] == "PAPER"
        self.paper_wins += 1
      elsif match[1] =="SCISSORS"
        self.scissors_wins += 1
      end
    elsif results[:draw].include?(match)
      self.draw_count += 1
    else
      puts "You can't use that here."
    end
  end

  def score_card
    card = Hash.new
    card = {
    "rock" => rock_wins,
    "paper" => paper_wins,
    "scissors" => scissors_wins,
    "draw" => draw_count
    }
  end

end
