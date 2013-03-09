class Die
  attr_reader  :las_step
  def initialize
    @las_step=0
  end
  def roll!
    @roll = rand(1..6)
  end
  def last_step
    @las_step+=1
  end
end