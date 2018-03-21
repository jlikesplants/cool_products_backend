class Product < ApplicationRecord
  require 'csv'
  
  has_and_belongs_to_many :advertisers
  validates :name, presence: true
  
  def self.import(file)
    CSV.foreach(file, headers: true) do |row|
      print row
    end
  end
end
