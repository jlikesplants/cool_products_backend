require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test 'should save with name and sku' do
    product = Product.new(name: 'Cool new product', sku: '00ddd123')
    assert product.save
  end
  
  test 'should not save product without name' do
    product = Product.new
    assert_not product.save
  end
  
  test 'should not save product without sku' do
    product = Product.new
    assert_not product.save
  end
end
