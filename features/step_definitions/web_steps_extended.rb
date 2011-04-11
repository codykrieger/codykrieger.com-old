When /^I confirm a js popup on the next step$/ do
  page.evaluate_script("window.alert = function(msg) { return true; }")
  page.evaluate_script("window.confirm = function(msg) { return true; }")
end

When /^I perform the following actions:$/ do |table|
  table.hashes.each do |row|
    case row['Action']
    when 'Fill in'
      Given "I fill in \"#{row['Field']}\" with \"#{row['Value']}\""
    when 'Check'
      if row['Value'] =~ /true/
        Given "I check \"#{row['Field']}\""
      else
        Given "I uncheck \"#{row['Field']}\""
      end
    when 'Choose'
      Given "I choose \"#{row['Field']}\""
    end
  end
end
