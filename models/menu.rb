require_relative './menu_item'

class Menu
  attr_reader :menu_items

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
end