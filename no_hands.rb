require_relative "rochambeau"

class Simulator < Game

  attr_accessor :computer1,
                :computer2,
                :rock_wins,
                :paper_wins,
                :scissors_wins,
                :draw_count

  def play
    self.computer1 = selection.upcase
    self.computer2 = selection.upcase
    match = [computer1, computer2]
    results(match)
  end

  def results(match)
    results = {}
    results[:winning] = ["ROCK", "SCISSORS"], ["PAPER", "ROCK"], ["SCISSORS", "PAPER"]
    results[:losing] = ["SCISSORS", "ROCK"], ["ROCK", "PAPER"], ["PAPER", "SCISSORS"]
    if results[:winning].include?(match)
      decision("computer 1")
      if match[0] == "ROCK"
        self.rock_wins =+ 1
      elsif match[0] == "PAPER"
        self.paper_wins =+ 1
      elsif match[0] =="SCISSORS"
        self.scissors_wins =+ 1
      end
    elsif results[:losing].include?(match)
      decision("computer 2")
      if match[1] == "ROCK"
        self.rock_wins =+ 1
      elsif match[1] == "PAPER"
        self.paper_wins =+ 1
      elsif match[1] =="SCISSORS"
        self.scissors_wins =+ 1
      end
    else
      draw
      self.draw_count += 1
    end
  end

  def decision(winner)
    puts "Computer 1: #{self.computer1} vs Computer: #{self.computer2} ----- #{winner.upcase} WINS"
    while winner == "computer 1"
      if self.computer1 == "ROCK"
        self.rock_wins += 1
      elsif self.computer1 == "PAPER"
        self.paper_wins += 1
      elsif self.computer1 == "SCISSORS"
        self.scissors_wins += 1
      end
    end
    while winner == "computer 2"
      if self.computer1 == "ROCK"
        self.rock_wins += 1
      elsif self.computer1 == "PAPER"
        self.paper_wins += 1
      elsif self.computer1 == "SCISSORS"
        self.scissors_wins += 1
      end
    end
  end

end

sim = Simulator.new

puts sim.inspect

# 1000.times do sim.play end
#
#   puts "Rock: #{rock_wins}"
#   puts "Paper: #{paper_wins}"
#   puts "Scissors: #{scissors_wins}"
#   puts "Draws: #{draw_count}"
