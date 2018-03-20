class Product < ApplicationRecord
  validates :name, :sku, presence: true
end
