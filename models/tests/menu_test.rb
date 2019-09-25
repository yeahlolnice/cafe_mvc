require "test/unit"
require_relative "../menu"

class MenuTest < Test::Unit::TestCase
  def setup
    @menu = Menu.new
    @menu.add_item("Latte", 3.50)
    @menu.add_item("Tea", 3.00)
    @menu.add_item("Scone", 5.00)
  end

  def test_get_price
    assert_equal(3.00, @menu.get_price("Tea"))
    assert_equal(5.00, @menu.get_price("Scone"))
  end
end
