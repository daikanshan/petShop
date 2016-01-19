class CreatePurchaserCarts < ActiveRecord::Migration
  def change
    create_table :purchaser_carts,options:"charset=utf8" do |t|
      
      t.timestamps null: false
    end
  end
end
