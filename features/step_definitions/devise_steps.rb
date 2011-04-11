When /^I log in as "([^\"]*)" with password "([^\"]*)"$/ do |email, password|
  visit(new_user_session_path)
  fill_in("user[email]", :with => email)
  fill_in("user[password]", :with => password)
  click_button("Sign in")
end

Given /^a logged in (\w+)$/ do |usertype|
  Factory.create(usertype.to_sym)
  visit(new_user_session_path)
  fill_in("user[email]", :with => "#{usertype}@quickleft.com")
  fill_in("user[password]", :with => "password")
  click_button("Sign in")
end

When /^I log out$/ do
  visit(destroy_user_session_path)
end

Given /^an? (\w+) "([^\"]*)"$/ do |usertype, email|
  Factory.create(usertype.to_sym, :email => email)
end
