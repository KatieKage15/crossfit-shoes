require 'pry'
require 'nokogiri'
require 'open-uri'

def run
  shoes = []
  puts "Welcome to the CrossFit Store!"
  puts "Which shoe would you like to choose?"
  html = open("https://www.store.crossfit.com/women-shoes")
  doc = Nokogiri::HTML(html)
  doc.css(".partner").map
    title.shoes.css(".title").text.strip
    shoes << title

  shoes.each.with_index(k) do |title, k|
    puts "#{k}, #{title}"
  end
end
