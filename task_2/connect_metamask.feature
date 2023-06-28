#
# connect_metamask.feature
#

Feature: Connect Metamask account to the faucet

  As a user of the faucet with a Metamask account
  I want to be able to connect my Metamask account to the faucet

  Scenario: Connect Metamask account
    Given I am on the faucet's homepage
    And I have a Metamask account installed and logged in
    When I click on the "Connect with Metamask" button
    Then the faucet should initiate the connection process with Metamask
    And detect the connected account
    And display the account's address or alias
    And display the account's balance and relevant details
    And securely handle the connection process without storing or exposing sensitive user data

  Scenario: Prompt to install or log in to Metamask
    Given I am on the faucet's homepage
    And I do not have Metamask installed or logged in
    When I click on the "Connect with Metamask" button
    Then the faucet should prompt me to install Metamask or log in
    And prevent further interaction until Metamask is installed or logged in

  Scenario: Disconnect Metamask account
    Given I am connected to the faucet with my Metamask account
    When I manually disconnect the Metamask account
    Then the faucet should clear any displayed account information
    And return to the initial state

  Scenario: Handle connection errors
    Given I am on the faucet's homepage
    And I have a Metamask account installed and logged in
    When I click on the "Connect with Metamask" button
    And there is a network connectivity issue or Metamask-specific error
    Then the faucet should display a clear error message
    And suggest possible solutions to resolve the issue

  Scenario: Persistent connection
    Given I have connected my Metamask account to the faucet
    And I have previously visited the faucet
    When I access the faucet again
    Then the faucet should automatically connect to my previously linked Metamask account
    And display the account's balance and relevant details

  Scenario: Compatibility and testing
    Given I am using a major browser like Chrome, Firefox, Safari, or Edge
    When I access the faucet's homepage
    Then the faucet's connection functionality should work seamlessly
    And be compatible with different browsers and operating systems

  Scenario: Documentation and help
    Given I am a user of the faucet
    When I need assistance with connecting my Metamask account
    Then the faucet's documentation or help section should provide clear instructions
    And troubleshoot common connection issues
