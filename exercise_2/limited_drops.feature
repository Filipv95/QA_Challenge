#
# limited_drops.feature
#
# All the scenarios in this feature file are high level

Feature: Limit drops to 1 per 24 hours

  As an owner of the faucet
  I want the number of drops to be limited to 1 per 24 hours

  Scenario: Allow one drop within 24 hours
    Given the current time is within the last 24 hours since the last drop
    When a user requests a drop from the faucet
    Then the faucet should allow the user to receive the drop
    And update the time of the last drop to the current time

  Scenario: Restrict drop within 24 hours
    Given the current time is within the last 24 hours since the last drop
    When a user requests a drop from the faucet
    Then the faucet should reject the user's request for another drop
    And display a message indicating that only one drop is allowed per 24 hours

  Scenario: Allow drop after 24 hours
    Given the current time is more than 24 hours since the last drop
    When a user requests a drop from the faucet
    Then the faucet should allow the user to receive the drop
    And update the time of the last drop to the current time

  Scenario: Track time accurately across multiple time zones
    Given the faucet's time tracking system accounts for different time zones
    When a user from a different time zone requests a drop
    Then the faucet should correctly calculate the 24-hour limit based on the user's local time
    And allow or restrict the drop accordingly

  Scenario: Testing with different time intervals
    Given the faucet's time tracking system is functioning correctly
    When multiple users request drops at different time intervals within a 24-hour period
    Then the faucet should accurately enforce the limit of one drop per 24 hours for each user

  Scenario: Compatibility and testing
    Given the faucet's functionality for limiting drops to 1 per 24 hours
    When testing the faucet on different browsers and operating systems
    Then the faucet should work seamlessly and consistently enforce the drop limit

  Scenario: Communication of drop availability
    Given a user has already received a drop within the last 24 hours
    When the user accesses the faucet's interface
    Then the faucet should clearly communicate that another drop is not available until the 24-hour limit is reached
    And provide the user with the remaining time until the next drop is available
