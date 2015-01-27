Feature:
  As a manager
  I can't be able to change my employees reviews
  So that the responsibility remains solely on the employee

  Background:
    Given I am a manager
    And I log in

  Scenario: Manager tries to fill employee's mid-year review
    And one of my employees has their objectives approved
    When I try to enter my employee's mid-year review
    Then I get an access error

  Scenario: Manager tries to fill employee's end-year review
    And one of my employees has their mid-year review approved
    When I try to enter my employee's end-year review
    Then I get an access error