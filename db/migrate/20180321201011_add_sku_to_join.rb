class AddSkuToJoin < ActiveRecord::Migration[5.1]
  def change
    add_column :advertisers_products, :sku, :string
    change_column :advertisers_products, :sku, :string, null: false
  end
end
