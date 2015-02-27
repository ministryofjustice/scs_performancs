Feature:
  As an employee
  I enter my personal details, and budgetary and headcount responsibilities
  So my line manager has context for reviewing my performance agreement

  Background:
    Given I am an employee
    And I log in

  Scenario: Employee enters personal details
    Given I have not entered personal details
    When I enter my personal details
    Then those personal details are saved
