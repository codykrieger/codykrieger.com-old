Feature: Resend Verification
  As an user
  I want to resend my verification email
  So that I can activate my account if I lost the original email

  Scenario: Follow resend verification email
    Given the following user records
    | email                | confirmed_at |
    | resend@quickleft.com | nil          |
    When I am on the login page
    And I follow "Didn't receive confirmation instructions?"
    And I fill in "Email" with "resend@quickleft.com"
    And I press "Resend confirmation instructions"
    Then I should see "You will receive an email with instructions about how to confirm your account in a few minutes."
    And 2 emails should be delivered to resend@quickleft.com
    When I click the first link in the email
    Then I should see "Your account was successfully confirmed. You are now signed in."
