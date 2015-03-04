Feature:
  As a manager
  I need to be able to formally approve objectives and reviews of my employees
  So that there is a permanent record of what was agreed between employee and manager

  Background:
    Given I am a manager
    And I log in

  Scenario: Manager approves a report
    And one of my employees has their objectives set
    When I approve those objectives
    Then the objectives are approved
    And the snapshot of those objectives is stored
    And the employee reports dashboard shows approval date

  Scenario: Manager approves mid-year progress
    And one of my employees has their mid-year review filled
    When I approve this mid-year review
    Then The review is approved
    And The snapshot of the objectives is stored
    And the employee reports dashboard shows mid-year approval date

  Scenario: Manager approves end-year progress
    And one of my employees has their end-year review filled
    When I approve this end-year review
    Then The review is approved
    And The snapshot of the objectives is stored
