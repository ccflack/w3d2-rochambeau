require_relative "game"
require_relative "simulator"

unless ARGV.length == 1
  puts "Please give an argument of \"play\" or \"simulate\"."
  exit
end

if ARGV[0] == "play"

 game = Game.new
 game.play

elsif ARGV[0] == "simulate"

  sim = Simulator.new
  1000.times do sim.play end

  puts "Rock: #{sim.rock_wins}"
  puts "Paper: #{sim.paper_wins}"
  puts "Scissors: #{sim.scissors_wins}"
  puts "Draws: #{sim.draw_count}"

  winner = sim.score_card.max_by{|k,v| v}

  puts "The most frequent result was #{winner[0]} with #{winner[1]} games."

end
