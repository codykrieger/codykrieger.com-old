Feature: Epic static pages
  As a visitor
  I want to view epic static pages
  So that I can glean epic knowledge from them
  
  Background:
    Given I am not viewing any pages

  Scenario: View existing pages
    When I request the following pages:
      | URL                | Page                |
      | /
      | /projects
      | /about
      | /about/work
      | /about/press
      | /contact
