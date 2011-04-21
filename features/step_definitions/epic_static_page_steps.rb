require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

urls = []

Given /^I am not viewing any pages$/ do
end

When /^I request the following pages:$/ do |table|
  table.rows_hash.each do |url, name|
    When %{I request the page "#{url}" with name "#{name}"}
  end
end

When /^I request the page "([^"]*)" with name "([^"]*)"$/ do |page, name|
  visit path_to(page)
  urls += [{ :url => page, :name => name, :page => page }]
end

When /^I request the following URLs:$/ do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end

Then /^I should receive a successful response$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should be redirected to the new URLs$/ do
  pending # express the regexp above with the code you wish you had
end

