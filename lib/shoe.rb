class Shoe

  attr_accessor :shoe_name, :color, :price, :title, :url

  @@all = []

  def initialize(title, url)
    @title = title
    @url = url 
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end
end
