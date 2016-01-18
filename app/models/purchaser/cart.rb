class Purchaser::Cart < ActiveRecord::Base
  has_many :lists,:dependent => :destroy
end
