class MenuView
  def display(items)
    puts "Menu"
    puts "-----"
    items.each do |item|
      puts "#{item.name}    ... $%.2f" % item.price
    end
    puts
  end
end
