require 'open-uri'
require 'nokogiri'
require 'pry'
require 'colorize'

class Scraper
  @crossfit_shoe = "https://www.store.crossfit.com/women-shoes"

  def self.scrape_shoes
    html = open(@crossfit_shoe)
    doc = Nokogiri::HTML(html)
    doc.css(".product-tile").each do |shoe| #loop - run through shoes and list them
      shoe_name = shoe.css(".title").text.strip
      data_url = shoe.css(".image a").attr("href").value
      shoe = Shoe.new(shoe_name, data_url)
      shoe.save
    end
  end

  def self.scrape_info(shoe)
    html = open(@crossfit_shoe + shoe.data_url)
    doc = Nokogiri::HTML(html)
      shoe.shoe_price = doc.css(".price-in")[0].text.split.map { |a| "#{a}" }.join(" ")
      shoe.shoe_product_details = doc.css(".prod-details").text.strip
  end
end
