class CreateAdminApplcts < ActiveRecord::Migration
  def change
    create_table :admin_applcts,options:"charset=utf8" do |t|
      t.integer :identity

      t.timestamps null: false
    end
  end
end
