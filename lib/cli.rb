require 'pry'

class Cli

  def run
    puts "Welcome to the CrossFit Store!"
    puts "Which shoe would you like to choose?"
    Scraper.scrape_shoes
    display_shoes
  end

  def display_shoes
    Shoe.all.each.with_index(1) do |shoe_name, i|
      puts "#{i}. #{shoe_name.title}"
    end
  end
end
