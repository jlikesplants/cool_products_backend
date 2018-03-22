class Product < ApplicationRecord  
  has_and_belongs_to_many :advertisers
  validates :name, presence: true
end
