Feature: Forgot password
  As an user
  I want to secure way to reset my password
  So that I can still login if I forget it

  Scenario: Follow forget your password link
    Given the following user records
    | email                |
    | forgot@quickleft.com |
    When I am on the login page
    And I follow "Forgot your password?"
    And I fill in "Email" with "forgot@quickleft.com"
    And I press "Send me reset password instructions"
    Then I should see "You will receive an email with instructions about how to reset your password in a few minutes."
    And 1 emails should be delivered to forgot@quickleft.com
    When I click the first link in the email
    And I fill in "Password" with "myNewP@ssword"
    And I fill in "Password confirmation" with "myNewP@ssword"
    And I press "Change my password"
    Then I should see "Your password was changed successfully. You are now signed in."
