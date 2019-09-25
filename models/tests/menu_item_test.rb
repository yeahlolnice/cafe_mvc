require "test/unit"
require_relative "../menu_item"

class MenuItemTest < Test::Unit::TestCase
  def setup
    @menuitem = MenuItem.new("Latte", 3.50)
  end

  def test_get_name
    assert_equal("Latte", @menuitem.name)
  end

  def test_get_price
    assert_equal(3.50, @menuitem.price)
  end
end
