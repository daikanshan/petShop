class CreatePurchaserOrders < ActiveRecord::Migration
  def change
    create_table :purchaser_orders,options:"charset=utf8" do |t|

      t.timestamps null: false
    end
  end
end
