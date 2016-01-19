class CreateAdminUsers < ActiveRecord::Migration
  def change
    create_table :admin_users,options:"charset=utf8" do |t|
      t.string :username
      t.string :password_digest
      t.integer :identity
      t.integer :money
      t.timestamps null: false
    end
  end
end
