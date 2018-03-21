class RemoveProductsColumns < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :sku, :string, null: false
    remove_column :products, :advertiser_id, :integer
  end
end


