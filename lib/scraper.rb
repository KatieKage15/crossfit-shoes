require 'open-uri'
require 'nokogiri'
require 'pry'
class Scraper

  def self.scrape_shoes
    html = open("https://www.store.crossfit.com/women-shoes")
    doc = Nokogiri::HTML(html)
    doc.css(".product-tile").each do |shoe| #loop - run through shoes and list them
      shoe_name = shoe.css(".title").text.strip
      shoe = Shoe.new(shoe_name, url)
      shoe.save
    end
  end


end
