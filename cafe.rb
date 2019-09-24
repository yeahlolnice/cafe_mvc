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

class MenuItem
  attr_reader :name,:price
  def initialize(name,price)
    @name = name
    @price = price
  end
end

class Menu
  def initialize
    @menu_items = []    
  end

  def add_item(name,price)
    @menu_items << MenuItem.new(name,price)
  end

  # Returns the price of an item on the menu given the name
  def get_price(item_name)
    @menu_items.each do |item|
      if item.name == item_name
        return item.price
      end
    end
  end

  def display
    puts "Menu"
    puts "-----"
    @menu_items.each do |item|
      puts "#{item.name}    ... $%.2f" % item.price
    end
    puts
  end
end

class Order
  def initialize
    @order_items = Hash.new(0)
  end

  def add_item(name, quantity)
    @order_items[name] += quantity
  end

  def get_items
    return @order_items
  end
 
end

class Cafe
  def initialize(name, menu_items)
    @name = name
    @menu = Menu.new
    @order = nil
    populate_menu(menu_items)
    # 1. Print a welcome message
    welcome
  end

  def welcome
    puts "Welcome to #{@name}!"
    puts
  end

  def populate_menu(menu_items)
    menu_items.each do |name,price|
      @menu.add_item(name,price)
    end
  end

  def get_order
    if !@order
      @order = Order.new
    end
    return @order
  end

  def add_to_order(item,quantity)
    get_order.add_item(item, quantity)
  end

  def display_menu
    @menu.display
  end

  # Returns the order total
  def order_total
    total = 0
    @order.get_items.each do |item,quantity|
      total += @menu.get_price(item) * quantity
    end
    return total
  end

  def display_order
    puts
    if @order
      # print the order
      puts "Thank you! Here is your order:"
      puts "------------------------------"
      @order.get_items.each do |item_name,quantity|
        puts "#{quantity} #{item_name}"
      end
      puts "Total:    $%.2f" % order_total
    else
      puts "Thank you for coming!"
    end
    puts
  end

end

# Main - our cafe application
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



coder_cafe = Cafe.new("Coder Cafe", {"latte" => 4.00, "tea" => 3.00, "scone" => 5.00})

# Ask the customer for their order (what they would like and quantity). Continue to ask for new items until they say they are done.
loop do
  # 2. Show the menu with prices
  coder_cafe.display_menu
  puts "What would you like to order? Enter (d)one when you are finished."
  input = gets.strip
  item = validate_input(input)
  # break if we're done
  break if item == "done"
  if item
    puts "How many would you like?"
    quantity = gets.to_i
    coder_cafe.add_to_order(item,quantity) if quantity > 0
  end
end

# 4. When the order is complete, print the order and total cost.
coder_cafe.display_order