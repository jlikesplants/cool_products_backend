require 'test_helper'

class AdvertiserTest < ActiveSupport::TestCase
  def setup
    @advertiser = advertisers(:one)
  end
  
  test 'valid advertiser' do
    assert @advertiser.valid?
  end
  
  test 'invalid without name' do
    @advertiser.name = nil
    assert_not @advertiser.valid?
  end
  
  test 'invalid with dup name' do
    dup = advertisers(:two)
    dup.name = @advertiser.name
    assert_not dup.valid?
  end  
end