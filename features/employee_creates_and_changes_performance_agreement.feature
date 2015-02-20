Feature:
  As an employee
  I want to be able to input my performance agreement objectives
  So that I can be judged on my performance

  Background:
    Given I am an employee
    And I log in

  @javascript
  Scenario: Employee creates new set of agreement objectives when providing valid information
    Given I have no agreements created
    When I create new agreement with some objectives
    Then the agreement is saved

  @javascript
  Scenario: Employee edits already created objectives
    Given I have an existing agreement
    When I change the objectives on the agreement
    Then the changes are saved on the agreement
