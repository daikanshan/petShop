# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if Admin::User.count == 0
  Admin::User.create(username:"admin",password:"admin",password_confirmation:"admin",identity:2)
end
(1..10).each do |p|
  Seller::Product.create(name:"product#{p}",price:10+p,user_id:1)
end
