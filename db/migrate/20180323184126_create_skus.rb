class CreateSkus < ActiveRecord::Migration[5.1]
  def change
    create_table :skus do |t|
      t.string :sku
      t.references :product, foreign_key: true
      t.references :advertiser, foreign_key: true

      t.timestamps
    end
  end
end
