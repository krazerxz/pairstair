Feature: Retrieving Cards

  @vcr
  Scenario: Fetching latest cards from Trello
    When I start the card updater
    Then I should see collaborations in the database
