class Product < ApplicationRecord  
  has_many :skus
  has_many :advertisers, through: :skus
  validates :name, presence: true, uniqueness: true
  
  def self.get_product_data
    product_data = Product.joins(:skus).joins(:advertisers).pluck("products.id, products.name, advertisers.name, skus.sku")
    
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
