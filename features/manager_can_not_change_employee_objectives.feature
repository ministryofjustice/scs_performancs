Feature:
  As a manager
  I can't be able to change my employees objectives
  So that the responsibility remains solely on the employee

  Background:
    Given I am a manager
    And I log in

  Scenario: Manager can't edit employees report
    And I have employees with reports filled
    When I try to change my employee's objectives
    Then I get an access error