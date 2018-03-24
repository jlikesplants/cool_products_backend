class Product < ApplicationRecord  
  has_many :skus
  has_many :advertisers, through: :skus
  validates :name, presence: true, uniqueness: true
  
  def self.get_product_data
    sql = "select skus.id, products.name, advertisers.name, skus.sku from products join skus on skus.product_id = products.id join advertisers on advertisers.id = skus.advertiser_id"
    product_data = ActiveRecord::Base.connection.execute(sql)
    
    results = []
    product_data.each do |entry| 
      result = {
        id: entry[0],
        product_name: entry[1],
        advertiser_name: entry[2],
        sku: entry[3]
      }
      results << result
    end
    
    results
  end
end

