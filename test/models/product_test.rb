require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  def setup
    @product = products(:one)
  end
  
  test 'valid product' do
    assert @product.valid?
  end
  
  test 'invalid without name' do
    @product.name = nil
    assert_not @product.valid?
  end
  
  test 'invalid with dup name' do
    dup = products(:two)
    dup.name = @product.name
    assert_not dup.valid?
  end  
end
