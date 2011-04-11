# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
# Setup initial user so we can get in
user = User.create! :name => "Cody Krieger", :email => "cody.krieger@gmail.com", :password => "uksJz0qKUwY=", :password_confirmation => "uksJz0qKUwY="
user.confirmed_at = user.confirmation_sent_at
user.save
Role.create! :name => 'Admin'
Role.create! :name => 'Member'

user1 = User.find_by_email('cody.krieger@gmail.com')
user1.role_ids = [1,2]
user1.save
