class Product < ApplicationRecord  
  has_many :skus
  has_many :advertisers, through: :skus
  validates :name, presence: true
end
