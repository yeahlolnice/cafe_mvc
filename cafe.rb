# Write a simple cafe application. 

# The cafe has a limited menu with 3 items:
# Lattes sell for $4
# Scones sell for $5
# Tea sells for $3

# Your application should:
# 1. Print a welcome message
# 2. Show the menu with prices
# 3. Ask the customer for their order (what they would like and quantity). Continue to ask for new items until they say they are done.
# 4. When the order is complete, print the order and total cost.

# Order class will represent the customer's order. It will have a hash of item names and quantities
# MenuItem class will represent a single menu item. It will have a name and price.
# Menu class will represent a cafe menu. It will have an array of items.
# Cafe class will represent a cafe. It will have a menu, an order, and a name.

# Main - our cafe application
require_relative "./controllers/cafe_controller"

def validate_input(input)
  case input[0].downcase
  when "l"
    return "latte"
  when "s"
    return "scone"
  when "t"
    return "tea"
  when "d"
    return "done"
  else
    puts "Invalid input. Please choose again."
    return nil
  end
end

cafe = CafeController.new
cafe.run

# coder_cafe = Cafe.new("Coder Cafe", {"latte" => 4.00, "tea" => 3.00, "scone" => 5.00})

# # Ask the customer for their order (what they would like and quantity). Continue to ask for new items until they say they are done.
# loop do
#   # 2. Show the menu with prices
#   coder_cafe.display_menu
#   puts "What would you like to order? Enter (d)one when you are finished."
#   input = gets.strip
#   item = validate_input(input)
#   # break if we're done
#   break if item == "done"
#   if item
#     puts "How many would you like?"
#     quantity = gets.to_i
#     coder_cafe.add_to_order(item,quantity) if quantity > 0
#   end
# end

# # 4. When the order is complete, print the order and total cost.
# coder_cafe.display_order