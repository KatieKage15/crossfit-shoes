class Crossfit::Shoe

  attr_accsessor :name, :shoe, :color, :price

  @@all = []

  def intialize(shoe = nil, color = nil, price = nil)
    @name = name
    @color = color
    @price = price
    @@all << self
  end

  def self.all
    @@all
  end