require 'pry'

class Cli

  def run
    puts "Welcome to the CrossFit Store!"
    puts "Here are all our shoes:"
    Scraper.scrape_shoes
    display_shoes
    menu
  end

  def display_shoes
    Shoe.all.each.with_index(1) do |shoe_name, i|
      puts "#{i}. #{shoe_name.title}"
    end
  end

  def menu
    puts "What shoe would you like more information on?"
    input = gets.chomp
    shoe = Shoe.all[input.to_i - 1]

    if !shoe
      puts "Sorry, that isn't a correct entry."
      puts "Please enter a valid shoe number."
      menu
    else
      Scraper.scrape_info(shoe)
      puts "Here are the detail for #{shoe.title}:"
      puts "The price is #{shoe.shoe_price}."
      puts "The color that you chose is #{shoe.shoe_color}"
      puts "The details of #{shoe.title} are: #{shoe.shoe_product_details}"
    end
  end
end
