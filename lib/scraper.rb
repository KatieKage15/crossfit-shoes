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
      data_url = doc.css(".image a").attr("href").value
      shoe = Shoe.new(shoe_name, data_url)
      shoe.save
    end
  end

  def self.scrape_info(shoe)
    html = open(@crossfit_shoe + shoe.data_url)
    doc = Nokogiri::HTML(html)
      shoe_color_url = doc.css(".color-variation-column a").attr("href").value
      shoe.shoe_price = doc.css(".buy-block-header").text.split[11..12].map { |a| "#{a}" }.join(" ")
      shoe.shoe_product_details = doc.css(".prod-details").text.strip
  end

  def self.scrape_shoe_color(shoe)
    html = open(@crossfit_shoe + shoe.data_url + shoe.shoe_color_url)
    doc = Nokogiri::HTML(html)
      binding.pry
    shoe_color = shoe.css(".title").text.strip
  end
end
