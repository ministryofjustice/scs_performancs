Feature:
  As a manager
  I need to be able to formally approve the contents of the form
  So that there is a permanent record of what was agreed between employee and manager

  Scenario: Manager approves a report
    Given I am a manager
    And I log in
    And one of my employees has their objectives set
    When I approve those objectives
    Then The objectives are approved
    And The snapshot of those objectives is stored

  Scenario: Manager approves mid-year progress
    Given I am a manager
    And I log in
    And one of my employees has their mid-year review filled
    When I approve this mid-year review
    Then The review is approved
    And The snapshot of the objectives is stored

  Scenario: Manager approves end-year progress
    Given I am a manager
    And I log in
    And one of my employees has their end-year review filled
    When I approve this end-year review
    Then The review is approved
    And The snapshot of the objectives is stored

  Scenario: Employee tries to approve their report
    Given I am an employee
    And I log in
    And I have an existing report
    When I try to approve my objectives
    Then I get an access error

  Scenario: Employee tries to approve their mid-year review
    Given I am an employee
    And I log in
    And I have some objectives approved
    When I try to approve my mid-year review
    Then I get an access error

  Scenario: Employee tries to approve their end-year review
    Given I am an employee
    And I log in
    And I have some objectives and mid-year review approved
    When I try to approve my end-year review
    Then I get an access error