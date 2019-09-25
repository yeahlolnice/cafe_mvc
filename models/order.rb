class Order
  attr_reader :order_items

  def initialize
    @order_items = Hash.new(0)
  end

  def add_item(name, quantity)
    @order_items[name] += quantity
  end

  def total(menu)
    total = 0
    @order_items.each do |item, quantity|
      total += menu.get_price(item) * quantity
    end
    return total
  end
end
