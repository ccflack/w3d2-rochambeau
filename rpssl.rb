class Game
  attr_accessor :player_one_choice,
                :computer

  def play
    puts "Let's play a game! Choose \"rock\", \"paper\", \"scissors\", \"lizard\", or \"spock\"."
    self.player_one_choice = gets.chomp.upcase
    self.computer = selection.upcase
    match = [player_one_choice, computer]
    results(match)
    replay
  end

  def selection
    %w(rock paper scissors spock lizard).sample
  end

  def results(match)
    results = {}
    results[:winning] = ["SCISSORS", "PAPER"], ["PAPER", "ROCK"], ["ROCK", "LIZARD"], ["LIZARD", "SPOCK"], ["SPOCK", "SCISSORS"], ["SCISSORS", "LIZARD"], ["LIZARD", "PAPER"], ["PAPER", "SPOCK"], ["SPOCK", "ROCK"], ["ROCK", "SCISSORS"]
    results[:draw] = ["ROCK", "ROCK"], ["PAPER", "PAPER"], ["SCISSORS", "SCISSORS"], ["SPOCK", "SPOCK"], ["LIZARD", "LIZARD"]
    if results[:winning].include?(match)
      decision("player")
    elsif results[:draw].include?(match)
      draw
    else
      decision("computer")
    end
  end

  def decision(winner)
      puts "Player: #{self.player_one_choice} vs Computer: #{self.computer} ----- #{winner.upcase} WINS"
  end

  def draw
    puts "I picked #{self.computer}, too! It's a draw. Go again!"
    play
  end

  def replay
    puts "Would you like to play again?"
    response = gets.chomp
    if response == "y"
      play
    else
      exit
    end
  end
end

game = Game.new
game.play
