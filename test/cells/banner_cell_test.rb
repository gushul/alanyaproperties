require 'test_helper'

class BannerCellTest < Cell::TestCase
  test "top" do
    invoke :top
    assert_select "p"
  end
  
  test "left" do
    invoke :left
    assert_select "p"
  end
  

end
