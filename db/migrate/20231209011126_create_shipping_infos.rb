class CreateShippingInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :shipping_infos do |t|
      t.string :postal_code
      t.string :phone_number
      t.integer :shipping_origin_id
      t.string :city
      t.string :address
      t.string :building_name
      t.references :purchase, null: false, foreign_key: true

      t.timestamps
    end
  end
end
