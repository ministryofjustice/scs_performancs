Feature:
  As an employee
  I need to be able to state my progress against each individual objective at Mid-Year Review and End of Year Review
  So that I can keep my objectives up to date and deal with changing circumstances

  Scenario: Employee fills in their mid-year review
    And I have some objectives approved
    When I enter my mid-year progress against my objectives
    Then my mid-year progress should be saved

  Scenario: Employee fills in their mid-year review
    And I have some objectives with mid-year progress
    When I change my mid-year progress against my objectives
    Then the changes are saved on my  mid-year progress