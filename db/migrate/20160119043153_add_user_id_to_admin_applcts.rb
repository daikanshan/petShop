class AddUserIdToAdminApplcts < ActiveRecord::Migration
  def change
    add_column :admin_applcts, :user_id, :integer
  end
end
