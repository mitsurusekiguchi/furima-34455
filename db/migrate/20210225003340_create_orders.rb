class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :item,  foregin_key: true
      t.references :user,  foregin_key: true
      t.timestamps
    end
  end
end
