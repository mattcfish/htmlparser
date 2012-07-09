class KSReward

  attr_accessor	:title, :price, :reward

  def initialize(title, price, reward)
    @title = title
    @price = price
    @reward = reward
  end

  def to_s
     @title + "\n" + @price + "\n" + @reward
  end

end
