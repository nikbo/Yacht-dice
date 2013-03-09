class Game
  attr_accessor :player_choice
  attr_reader :chanc
  def initialize(players)
    @players=players
    @player_choice=nil
    @chanc=0
  end
  def winner
    b=[]
    @players.each  {|player| b<<player.points}
    b.sort!
    if b[0]==b[b.length-1]
      puts "Ups, drawn game!"
    else
      winner = @players.max_by {|player| player.points}
      puts "Congratulations, #{winner.name}, you win!!!"
    end
  end
  def chance
     @chanc+=1
  end
end