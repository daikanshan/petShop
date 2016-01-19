class CreatePurchaserLists < ActiveRecord::Migration
  def change
    create_table :purchaser_lists,options:"charset=utf8" do |t|
      t.integer :cart_id
      t.integer :product_id
      t.timestamps null: false
    end
  end
end
