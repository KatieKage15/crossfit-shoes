require 'pry'

class Cli

  def run
    puts "Welcome to the CrossFit Store!".magenta
    puts "Here are all our shoes:".magenta
    Scraper.scrape_shoes
    display_shoes
    menu
  end

  def display_shoes
    Shoe.all.each.with_index(1) do |shoe_name, i|
      puts "#{i}. #{shoe_name.title}".magenta
    end
  end

  def menu
    puts "What shoe would you like more information on?".white
      input = gets.chomp

      shoe = Shoe.all[input.to_i - 1]

      if !shoe
        puts "Sorry, that isn't a correct entry.".red
        puts "Please enter a valid shoe number.".red
        menu
      else
        Scraper.scrape_info(shoe)
        puts "Here are the details for #{shoe.title}:".blue
        puts "The price is #{shoe.shoe_price}.".blue
        puts "#{shoe.shoe_product_details}".blue
        menu
      end
  end
end
