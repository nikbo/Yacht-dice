require './lib/try'
require './lib/player'
require './lib/step'
require './lib/die'
require './lib/chance'
players = [Player.new("Gulec 1"), Player.new("Gulec 2")]
die=Die.new
game=Game.new(players)
puts "Hi, it's yacht dice game"
until die.las_step==13
  puts "Ok, new turn!!!\n\n"
  players.each do |player|
    steps=Steps.new(player)
    puts "#{player.name}, your turn.\n\n"
    until steps.steps_sum==5
      steps.step(die.roll!)
      puts "You rolled a #{steps.stp}."
    end
    steps.check
    steps.steps_sum=0
    puts "You have #{player.points} points total."
  end
  die.last_step
end
Chance.new(game,players,die).chance
game.winner