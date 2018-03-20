class ChangeProductsColumns < ActiveRecord::Migration[5.1]
  def change
    change_column_null :products, :name, false
    change_column_null :products, :sku, false
  end
end
