Feature: Admin dashboard
  As an administrator
  I want to manage the application
  So that I can have full control over the site

  Scenario: Login as an admin
    Given a logged in admin
    When I am on the admin
    Then I should see "Admin"
