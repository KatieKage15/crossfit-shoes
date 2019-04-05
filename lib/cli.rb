require 'pry'
require 'nokogiri' #parsing data
require 'open-uri' #open webpage

def run
  shoes = []
  puts "Welcome to the CrossFit Store!"
  puts "Which shoe would you like to choose?"
  html = open("https://www.store.crossfit.com/women-shoes")
  doc = Nokogiri::HTML(html)
  doc.css(".partner")[0].collect {|title|} #loop - run through shoes and list them
    title = shoes.css(".title").text.strip
    shoes << title

      binding.pry
  shoes.each.with_index(1) do |title, i|
    puts "#{i}. #{title}"
  end
end
