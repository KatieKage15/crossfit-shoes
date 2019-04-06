require 'open-uri'
require 'nokogiri'
require 'pry'
class Scraper

  def self.scrape_shoes
    crossfit_shoe = "https://www.store.crossfit.com/women-shoes"
    html = open(crossfit_shoe)
    doc = Nokogiri::HTML(html)
    doc.css(".product-tile").each do |shoe| #loop - run through shoes and list them
      shoe_name = shoe.css(".title").text.strip
      url = doc.css(".product-info-inner-content a").attr("href").value
      shoe = Shoe.new(shoe_name, url)
      shoe.save
    end
  end

  def self.scrape_info(shoe)
    crossfit_shoe = "https://www.store.crossfit.com/women-shoes"
    html = open(crossfit_shoe + shoe.url)
    doc = Nokogiri::HTML(html)
      binding.pry 
  end


end
