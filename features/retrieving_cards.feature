Feature: Retrieving Cards

  @vcr_card_fetch
  Scenario: Fetching latest cards from Trello
    When I start the card updater
    Then I should see collaborations in the database
