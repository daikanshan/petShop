class CreateSellerProducts < ActiveRecord::Migration
  def change
    create_table :seller_products,options:"charset=utf8" do |t|
      t.string :name
      t.float :price
      t.integer :quantity
      t.string :img_url
      t.integer :verified
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
