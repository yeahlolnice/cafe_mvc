class OrderView
  def display(items, order_total)
    puts
    puts "Thank you! Here is your order:"
    puts "------------------------------"
    items.each do |item_name, quantity|
      puts "#{quantity} #{item_name}"
    end
    puts "Total:    $%.2f" % order_total
    puts
  end

  def get_order
    puts "What would you like to order? Enter (d)one when you are finished."
    return gets.strip
  end

  def get_qty
    puts "How many would you like?"
    return gets.to_i
  end
end
