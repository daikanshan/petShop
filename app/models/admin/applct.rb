class Admin::Applct < ActiveRecord::Base
  belongs_to :user
  validates :user_id, uniqueness:{value:true,message:"您已经申请过了，请耐心等待"}
end
