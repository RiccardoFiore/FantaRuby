Feature: I want to create day's formation
		As Player
		I want to select some players of my team
		So that I can insert formation

Scenario: Create Days Formation
	Given I am on the new formation page
	And I have a list of soccer's player in my rose
	When I click on soccer's player name
	Then I should be on new formation page again
    And I have to see this soccer's player disappear from my rose's player list
    And I have to see this soccer's player appear in the my formation's list
