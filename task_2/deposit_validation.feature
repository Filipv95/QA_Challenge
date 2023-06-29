#
# deposit_validation.feature
#

Feature: Validate deposit address for correctness

  As a user of the faucet
  I want my deposit address to be validated for correctness

  Background: Open Avalanche faucet url(https://faucet.avax.network/)
    Given I am on the Avalanche faucet url

  Scenario: Validate deposit address format
    When I enter a valid deposit address in the Address field
    Then I should not see invalid message displayed

  Scenario: Display error for incorrect deposit address format
    When I enter an invalid deposit address in the Address field
    Then I should see invalid message displayed