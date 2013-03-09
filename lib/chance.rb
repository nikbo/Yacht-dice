class Chance
  def initialize(game,players,die)
    @game=game
    @players=players
    @die=die
  end

  def chance
    until @game.player_choice == "no" || @game.player_choice == "no" || @game.chanc == 2
      @players.each do |player|
        @steps=Steps.new(player)
        puts "#{player.name}, would you like to make one more attempt?.\n\n"
        @game.player_choice=gets.chomp
        until @steps.steps_sum==5
          @steps.step(@die.roll!)
          puts "You rolled a #{@steps.stp}."
        end
        @steps.check
        @steps.steps_sum=0
        puts "You have #{player.points} points total."
      end
      @game.chance
    end
  end
end