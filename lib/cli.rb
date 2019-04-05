require 'pry'
require 'nokogiri' #parsing data
require 'open-uri' #open webpage

def run
  shoes = []
  puts "Welcome to the CrossFit Store!"
  puts "Which shoe would you like to choose?"
  html = open("https://www.store.crossfit.com/women-shoes")
  doc = Nokogiri::HTML(html)
  doc.css(".product-tile").each do |title| #loop - run through shoes and list them
    shoe = title.css(".title").text.strip
    shoes << shoe
  end
  shoes.each.with_index(1) do |title, i|
    puts "#{i}. #{title}"
  end
end
