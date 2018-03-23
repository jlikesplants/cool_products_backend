class AddUniqueConstrainttoSku < ActiveRecord::Migration[5.1]
  def change
    add_index :skus, [:advertiser_id, :product_id, :sku], unique: true
  end
end

