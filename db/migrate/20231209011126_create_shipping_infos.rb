class CreateShippingInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :shipping_infos do |t|
      t.string :postal_code,null: false
      t.string :phone_number,null: false
      t.integer :shipping_origin_id,null: false
      t.string :city,null: false
      t.string :address,null: false
      t.string :building_name
      t.references :purchase, null: false,null: false, foreign_key: true

      t.timestamps
    end
  end
end
