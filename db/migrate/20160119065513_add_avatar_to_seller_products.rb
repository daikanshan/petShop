class AddAvatarToSellerProducts < ActiveRecord::Migration
  def change
    add_column :seller_products, :avatar, :string
  end
end
