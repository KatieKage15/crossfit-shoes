class Shoe

  attr_accessor :shoe_name, :color, :price, :title, :data_url

  @@all = []

  def initialize(title, data_url)
    @title = title
    @data_url = data_url
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end
end
