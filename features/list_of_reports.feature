Feature:
  As an employee
  I want to see the list of all existing reports
  So that I can change them


  Scenario: Employee has an existing report
    Given I have an existing report
    When I display the reports page
    Then I can see the existing report on the page
