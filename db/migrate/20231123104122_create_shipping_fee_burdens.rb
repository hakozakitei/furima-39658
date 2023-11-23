class CreateShippingFeeBurdens < ActiveRecord::Migration[7.0]
  def change
    create_table :shipping_fee_burdens do |t|

      t.timestamps
    end
  end
end
