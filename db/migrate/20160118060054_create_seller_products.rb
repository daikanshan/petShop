class CreateSellerProducts < ActiveRecord::Migration
  def change
    create_table :seller_products,options:"charset=utf8" do |t|
      t.string :name
      t.float :price
      t.string :img_url
      t.integer :verified

      t.timestamps null: false
    end
  end
end
