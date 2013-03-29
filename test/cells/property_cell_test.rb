require 'test_helper'

class PropertyCellTest < Cell::TestCase
  test "sidebar" do
    invoke :sidebar
    assert_select "p"
  end
  

end
