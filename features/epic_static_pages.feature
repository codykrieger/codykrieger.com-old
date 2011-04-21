Feature: Epic static pages
  As a visitor
  I want to view epic static pages
  So that I can glean epic knowledge from them
  
  Background:
    Given I am not viewing any pages

  Scenario: View existing pages
    When I request the following pages:
      | /                  | home                |
      | /projects          | apps & projects     |
      | /about             | about               |
      | /about/work        | work - about        |
      | /about/press       | press - about       |
      | /contact           | contact             |
    Then I should receive a successful response

  Scenario: View redirected pages
    When I request the following pages:
      | /getintouch               | /contact                             |
      | /work                     | /about/work                          |
      | /blog                     | http://blog.codykrieger.com          |
      | /blog/somepage            | http://blog.codykrieger.com/somepage |
    Then I should be redirected to the new URLs

  Scenario: Uber important pages
    When I request the following pages:
      | /gfxCardStatus              | gfxCardStatus               |
      | /gfxCardStatus/faq          | faq - gfxCardStatus         |
      | /gfxCardStatus/changelog    | changelog - gfxCardStatus   |
      | /gfxCardStatus/features     | features - gfxCardStatus    |
      | /gfxCardStatus/screenshots  | screenshots - gfxCardStatus |
      | /compressify                | Compressify                 |
      | /compressify/support        | support - Compressify       |
    Then I should receive a successful response

