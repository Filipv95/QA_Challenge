#
# connect_metamask.feature
#

Feature: Connect Metamask account to the faucet

  As a user of the faucet with a Metamask account
  I want to be able to connect my Metamask account to the faucet

  Background: Open Avalanche faucet url(https://faucet.avax.network/)
    Given I am on the Avalanche faucet url
    Then I should see Fuji-C Chain under Select Network
    And AVAX under Select Token 

  Scenario: Connect Metamask account which is installed
    When I have a Metamask account installed and logged in
    And I should see "Connect Wallet" button in top right corner
    And I should see empty field under Address
    And I click on the "Connect Wallet" button
    And I choose "MetaMask wallet" and accept "Terms"
    Then I should be on Portfolio page
    And I should see a wallet address at top right corner
    And I should see the all account's details

  Scenario: Disconnect a connected Metamask account
    When I have a Metamask account connected
    Then I should not see "Connect Wallet" button
    And I should see the address in top riht corner
    And I should see the address under Address field
    When I click on the address in top right corner and click Disconnect button
    Then I should see "Disconnected Successfully" message
    And I should see "Connect Wallet" button in top right corner

# The following are high level test scenarios

  Scenario: Handle connection errors
    When I have a Metamask account installed and logged in
    And I click on the "Connect with Metamask" button
    And there is a network connectivity issue or Metamask-specific error
    Then the faucet should display a clear error message
    And suggest possible solutions to resolve the issue

  Scenario: Persistent connection
    When I have a Metamask account installed and logged in
    And I have previously visited the faucet
    And I access the faucet again
    Then the faucet should automatically connect to my previously linked Metamask account
    And display the account's balance and relevant details

  Scenario: Documentation and help
    When I have a Metamask account installed and logged in
    And I need assistance with connecting my Metamask account
    Then the faucet's documentation or help section should provide clear instructions
    And troubleshoot common connection issues
