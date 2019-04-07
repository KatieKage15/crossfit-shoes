require 'open-uri'
require 'nokogiri'
require 'pry'
class Scraper
  @crossfit_shoe = "https://www.store.crossfit.com/women-shoes"

  def self.scrape_shoes
    html = open(@crossfit_shoe)
    doc = Nokogiri::HTML(html)
    doc.css(".product-tile").each do |shoe| #loop - run through shoes and list them
      shoe_name = shoe.css(".title").text.strip
      url = doc.css(".hockeycard").attr("data-context").value
      shoe = Shoe.new(shoe_name, url)
      shoe.save
    end
  end

  def self.scrape_info(shoe)
    html = open(@crossfit_shoe + shoe.url)
    doc = Nokogiri::HTML(html)
  end


end
