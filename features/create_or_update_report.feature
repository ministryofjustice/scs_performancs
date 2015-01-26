Feature:
  As an employee
  I want to be able to input up to 10 Development objectives
  So that I can be judged on my performance

  Scenario: Employee creates new set of objectives when providing valid information
    Given I am an employee
    And I log in
    And I have no reports created
    When I create new report with some objectives
    Then the report are saved

  Scenario: Employee edits already created objectives
    Given I am an employee
    And I log in
    And I have an existing report
    When I change the objectives on the report
    Then the changes are saved on the report

  Scenario: Manager can't edit employees report
    Given I am a manager
    And I log in
    And I have employees with reports filled
    When I try to change my employee's objectives
    Then I get an access error