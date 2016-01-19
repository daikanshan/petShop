class Seller::Product < ActiveRecord::Base
  belongs_to :user ,class_name:"Admin::User"
  has_many :lists
  before_destroy :ensure_not_referenced_by_any_list

  private
  def ensure_not_referenced_by_any_list
    if lists.empty?
      return true
    else
      errors.add(:base,'List present')
      return false
    end
  end
end
