class Steps
  attr_reader :stp
  attr_accessor :steps_sum
  def initialize(player)
    @player=player
    @steps_sum=0
    @a=[]
    @steps_all=0
  end
  def step(stp)
    @stp=stp
    @steps_sum+=1
    @a<<stp
  end
  def check
    @a.sort!
    if @a[0]==@a[4]
      @steps_all+=50
    elsif @a[0]==@a[3] || @a[1]==@a[4]
      @steps_all+=@a[0]+@a[1]+@a[2]+@a[3]+@a[4]
    elsif @a[0]==(@a[4]-4) && @a[0]==(@a[1]-1) && @a[0]==(@a[2]-2) && @a[0]==(@a[3]-3)
      @steps_all+=40
    elsif (@a[0]==@a[1] &&(@a[2]==@a[3] && @a[2]==@a[4])) || ((@a[0]==@a[1] && @a[0]==@a[2]) && @a[3]==@a[4])
      @steps_all+=25
    end
    @a=[]
    @player.add_points(@steps_all)
    @steps_all=0
  end
end