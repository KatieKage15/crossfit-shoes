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
      url = shoe.css(".product-info-inner-content a").("href").value
      shoe.save
    end
  end

  def self.scrape_info(movie)
    html = open("https://www.store.crossfit.com/women-shoes" + movie.url)
    doc = Nokogiri::HTML(html)
  end


end
