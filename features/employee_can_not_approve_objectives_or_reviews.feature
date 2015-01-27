Feature:
  As an employee
  I can't be able to approve my objectives or reviews
  So that I can't bypass my manager

  Background:
    Given I am an employee
    And I log in

  Scenario: Employee tries to approve their report
    And I have an existing report
    When I try to approve my objectives
    Then I get an access error

  Scenario: Employee tries to approve their mid-year review
    And I have some objectives approved
    When I try to approve my mid-year review
    Then I get an access error

  Scenario: Employee tries to approve their end-year review
    And I have some objectives and mid-year review approved
    When I try to approve my end-year review
    Then I get an access error