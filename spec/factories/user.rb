Factory.define :user do |u| 
  u.sequence(:name) { |n| "Quick #{n}" }
  u.sequence(:email) { |n| "user.#{n}@quickleft.com" }
  u.password "password" 
  u.confirmed_at Time.new.to_s
  u.confirmation_sent_at Time.new.to_s
  u.password_confirmation { |u| u.password } 
end 

Factory.define :admin, :parent => :user do |admin| 
  admin.email "admin@quickleft.com"
  admin.password "password" 
  admin.roles { [ Factory(:role, :name => 'Admin') ] }
end 

Factory.define :member, :parent => :user do |member|
  member.email "member@quickleft.com"
  member.password "password"
  member.roles { [ Factory(:role, :name => 'Member') ] } 
end

Factory.define :role do |role| 
  role.sequence(:name) { |n| "Quick #{n}".camelize }
end
