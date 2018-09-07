Feature: I want to change the President of a League
        As an Admin
        I want to have a settings
        So that I can change the President of a League

Scenario: Change President
	Given I am authenticated as Admin
    And I am on the settings page
	When I click on "Change President" link
	Then I should be on edit page of league
    When I click on "Salva Cambiamenti"
    Then the president should be changed


