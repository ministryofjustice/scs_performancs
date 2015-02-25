Feature:
  As an employee
  I need to be able to comment on my performance at Mid-Year Review and End of Year Review
  So that I can keep my objectives up to date and deal with changing circumstances

  Background:
    Given I am an employee
    And I log in

  Scenario: Employee fills in their mid-year comment on agreement
    And I have an agreement approved
    When I enter my mid-year progress against my objectives
    Then my mid-year progress should be saved
