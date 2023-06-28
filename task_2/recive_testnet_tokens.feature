#
# recive_testnet_tokens.feature
#

Feature: Receive test tokens with deposit address

  As a user of the faucet
  I want to be able to receive test tokens without connecting my Metamask account to the faucet 
  by simply entering my deposit address

  Scenario: Enter deposit address to receive test tokens
    Given I am on the faucet's homepage
    And I want to receive test tokens without connecting my Metamask account
    When I enter my deposit address in the designated field
    And click on the "Receive Test Tokens" button
    Then the faucet should initiate the token distribution process
    And send the specified amount of test tokens to the provided deposit address
    And display a confirmation message or transaction ID

  Scenario: Display error for invalid deposit address
    Given I am on the faucet's homepage
    And I want to receive test tokens without connecting my Metamask account
    When I enter an invalid deposit address in the designated field
    And click on the "Receive Test Tokens" button
    Then the faucet should display an error message indicating an invalid deposit address
    And prevent further interaction until a valid deposit address is provided

  Scenario: Handle token distribution errors
    Given I am on the faucet's homepage
    And I want to receive test tokens without connecting my Metamask account
    When I enter my deposit address in the designated field
    And click on the "Receive Test Tokens" button
    And there is an error during the token distribution process
    Then the faucet should display a clear error message indicating the issue
    And suggest possible solutions to resolve the error

  Scenario: Display instructions for receiving test tokens
    Given I am on the faucet's homepage
    And I want to receive test tokens without connecting my Metamask account
    When I access the faucet's help section or documentation
    Then the faucet should provide clear instructions on how to enter the deposit address
    And guide me through the process of receiving test tokens

  Scenario: Compatibility and testing
    Given I am using a major browser like Chrome, Firefox, Safari, or Edge
    When I access the faucet's homepage
    Then the faucet's functionality for receiving test tokens with a deposit address should work seamlessly
    And be compatible with different browsers and operating systems
x