class Product < ApplicationRecord  
  has_many :skus
  has_many :advertisers, through: :skus
  validates :name, presence: true
  
  def self.get_products_with_ad_sku
    Product.joins(:skus).joins(:advertisers).pluck("products.name, advertisers.name, skus.sku")
  end
end
