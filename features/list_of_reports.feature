Feature:
  As an employee
  I want to see the list of all existing reports
  So that I can change them

  Background:
    Given I am an employee
    And I log in

  Scenario: Employee lists existing reports
    Given I have an existing report
    When I display the reports page
    Then I can see the existing report on the page
