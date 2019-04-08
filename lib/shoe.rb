class Shoe

  attr_accessor :shoe_product_details, :shoe_color, :shoe_price, :title, :data_url

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
