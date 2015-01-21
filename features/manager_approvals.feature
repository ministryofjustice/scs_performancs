Feature:
  As a manager
  I need to be able to formally approve the contents of the form
  So that there is a permanent record of what was agreed between employee and manager

  @wip
  Scenario: Manager approves a report
    Given I am a manager
    And I one of my employees has their objectives set
    When I approve those objectives
    Then The objectives are approved
    And The snapshot of those objectives is stored