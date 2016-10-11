
class Game
  attr_accessor :player_one_choice, :computer

  def play
    puts "Let's play a game! Choose \"rock\", \"paper\", or \"scissors\"."
    self.player_one_choice = gets.chomp.upcase
    self.computer = selection.upcase
    match = [player_one_choice, computer]
    results(match)
  end

  def selection
    %w(rock paper scissors).sample
  end

  def results(match)
    results = {}
    results[:winning] = ["ROCK", "SCISSORS"], ["PAPER", "ROCK"], ["SCISSORS", "PAPER"]
    results[:losing] = ["SCISSORS", "ROCK"], ["ROCK", "PAPER"], ["PAPER", "SCISSORS"]
    if results[:winning].include?(match)
      decision("player")
    elsif results[:losing].include?(match)
      decision("computer")
    else
      draw
    end
  end

  def decision(winner)
      puts "Player: #{self.player_one_choice} vs Computer: #{self.computer} ----- #{winner.upcase} WINS"
  end


  def draw
    puts "It's a draw. Go again!"
  end

end

game = Game.new
game.play
