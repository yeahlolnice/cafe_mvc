require_relative '../views/cafe'
require_relative '../views/menu'
require_relative '../views/order'
require_relative '../models/cafe'

class CafeController
  def initialize
    @cafe_model = Cafe.new("Coder Cafe", { "latte" => 4.00, "tea" => 3.00, "scone" => 5.00 })
    @cafe_view = CafeView.new
    @menu_view = MenuView.new
    @order_view = OrderView.new
  end

  def run
    @cafe_view.welcome(@cafe_model.name)
    # Ask the customer for their order (what they would like and quantity). Continue to ask for new items until they say they are done.
    loop do
      # 2. Show the menu with prices
      @menu_view.display(@cafe_model.menu.menu_items)
      input = @order_view.get_order
      item = validate_input(input)
      # break if we're done
      break if item == "done"
      if item
        quantity = @order_view.get_qty
        @cafe_model.add_to_order(item, quantity) if quantity > 0
      end
    end

    # 4. When the order is complete, print the order and total cost.
    total = @cafe_model.get_order.total(@cafe_model.menu)
    @order_view.display(@cafe_model.get_order.order_items, total)
  end
end
