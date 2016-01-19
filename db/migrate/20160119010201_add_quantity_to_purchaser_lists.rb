class AddQuantityToPurchaserLists < ActiveRecord::Migration
  def change
    add_column :purchaser_lists, :quantity, :integer,:default => 1
  end
end
