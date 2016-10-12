class Game
  attr_accessor :player_one_choice,
                :computer,
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
    puts "Let's play a game! Choose \"rock\", \"paper\", or \"scissors\"."
    self.player_one_choice = STDIN.gets.chomp.upcase
    self.computer = selection.upcase
    match = [player_one_choice, computer]
    results(match)
    replay
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
      decision("player")
      if match[0] == "ROCK"
        self.rock_wins =+ 1
      elsif match[0] == "PAPER"
        self.paper_wins =+ 1
      elsif match[0] =="SCISSORS"
        self.scissors_wins =+ 1
      end
    elsif results[:losing].include?(match)
      decision("computer")
      if match[1] == "ROCK"
        self.rock_wins =+ 1
      elsif match[1] == "PAPER"
        self.paper_wins =+ 1
      elsif match[1] =="SCISSORS"
        self.scissors_wins =+ 1
      end
    elsif results[:draw].include?(match)
      draw
      self.draw_count += 1
    else
      puts "You can't use that here."
    end
  end

  def decision(winner)
      puts "Player: #{self.player_one_choice} vs Computer: #{self.computer} ----- #{winner.upcase} WINS"
  end

  def draw
    puts "I picked #{self.computer}, too! It's a draw. Go again!"
    play
  end

  def score
    "Rock won #{self.rock_wins} times. \nPaper won #{self.paper_wins} times. \nScissors won #{self.scissors_wins} times. \nThere were #{self.draw_count} draws."
  end

  def replay
    puts "Would you like to play again?"
    response = STDIN.gets.chomp
    if response == "y"
      play
    else
      puts score
      exit
    end
  end
end
