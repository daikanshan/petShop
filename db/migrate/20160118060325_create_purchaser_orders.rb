class CreatePurchaserOrders < ActiveRecord::Migration
  def change
    create_table :purchaser_orders,options:"charset=utf8" do |t|
      t.integer :user_id
      t.integer :cart_id
      t.integer :handled
      t.timestamps null: false
    end
  end
end
