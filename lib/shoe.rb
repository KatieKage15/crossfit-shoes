class Shoe

  attr_accessor :shoe_name, :color, :price, :title

  @@all = []

  def initialize(title)
    @title = title 
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end
end
