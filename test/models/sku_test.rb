require 'test_helper'

class SkuTest < ActiveSupport::TestCase
  def setup
    @product = Product.new(name: "Blue hat")
    @advertiser = Advertiser.new(name: "Kmart")
    @sku = Sku.new(sku: "sku9999999", advertiser: @advertiser, product: @product)
  end
  
  test 'valid sku' do
    assert @sku.valid?
  end
  
  test 'invalid without sku' do
    @sku.sku = nil
    assert_not @sku.valid?
  end
end
