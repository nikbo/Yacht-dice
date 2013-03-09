class Steps
  attr_reader :stp
  attr_accessor :steps_sum
  def initialize(player)
    @player=player
    @steps_sum=0
    @a=[]
    @steps_all=0
    @mas=[]
    @ch=0
  end
  def step(stp)
    @stp=stp
    @steps_sum+=1
    @a<<stp
  end
  def check
    @mas.each do |el|
    if el=@a.sort!
      @ch+=1
    end
    end
    if @ch>0
    @a=[]
    else
    @a.sort!
    @mas<<@a

    if @a[0]==@a[4]
      @steps_all+=50
    elsif @a[0]==@a[3] || @a[1]==@a[4]
      @steps_all+=@a[0]+@a[1]+@a[2]+@a[3]+@a[4]
    elsif @a[0]==(@a[4]-4) && @a[0]==(@a[1]-1) && @a[0]==(@a[2]-2) && @a[0]==(@a[3]-3)
      @steps_all+=40
    elsif (@a[0]==@a[1] &&(@a[2]==@a[3] && @a[2]==@a[4])) || ((@a[0]==@a[1] && @a[0]==@a[2]) && @a[3]==@a[4])
      @steps_all+=25
    elsif @a[0]==@a[1] && @a[0]==@a[2]
      @steps_all+=@a[0]+@a[1]+@a[2]
    elsif @a[1]==@a[2] && @a[1]==@a[3]
      @steps_all+=@a[1]+@a[2]+@a[3]
    elsif @a[2]==@a[3] && @a[2]==@a[4]
      @steps_all+=@a[2]+@a[3]+@a[4]
    elsif (@a[0]==(@a[3]-3) && @a[0]==(@a[1]-1) && @a[0]==(@a[2]-2)) || (@a[1]==(@a[4]-3) && @a[1]==(@a[2]-1) && @a[1]==(@a[3]-2))
      @steps_all+=30
    end
    @a=[]
    @player.add_points(@steps_all)
    @steps_all=0
    end
  end
end