class AdvertisersProductsJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :advertisers, :products
  end
end
