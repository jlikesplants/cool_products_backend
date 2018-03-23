class DropAdvertisersProducts < ActiveRecord::Migration[5.1]
  def change
    drop_table :advertisers_products, force: :cascade
  end
end
