require 'pry'
require 'nokogiri'
require 'open-uri'

def run
  shoes = []
  puts "Welcome to the CrossFit Store!"
  puts "Which shoe would you like to choose?"
  html = open("https://www.store.crossfit.com/women-shoes")
  doc = Nokogiri::HTML(html)
    binding.pry

  doc.css(".partner").collect {|title|}
    title = shoes.css(".title").text.strip
    shoe = Shoe.new(title)
    movie.save

  Shoe.all.each.with_index(s) do |title, s|
    puts "#{s}, #{title}"
  end
end
