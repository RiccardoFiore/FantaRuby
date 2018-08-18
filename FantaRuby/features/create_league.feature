Feature: I want to create a league
        As a User
        I want to create a league
        So that I can become a president.

Scenario: Create League
	Given I am a User
	And I am on the fantaruby page
	When I click on "Crea lega" link 
	Given I am on the crea nuova lega page
	And I filled the lega form
	When I click "Crea" 
        Then I should be redirected to Crea rosa page
        Then I should be redirected to Crea rosa page
        And I should be a president
