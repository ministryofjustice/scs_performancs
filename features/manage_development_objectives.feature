Feature:
  As an employee
  I want to be able to input up to 10 Development objectives
  So that I can be judged on my performance

  Scenario: Employee creates new set of objectives when providing valid information
    Given I have no objectives set
    When I create new set of objectives with valid information
    Then the objectives are saved

  @wip
  Scenario: Employee edits already created objectives
    Given I have my objectives set
    When I change the objectives
    Then the new objectives are saved