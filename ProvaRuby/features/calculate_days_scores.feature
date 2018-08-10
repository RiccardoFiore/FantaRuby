Feature: I want to calculate day's scores
		As president
		I want to have settings
		So that i can calculate day's scores

Scenario: Calculate Days Scores
	Given I am authenticated president
	And I am on the league home page
	When I click on "Calcola punteggi giornalieri"
	Given I am on the rate score page
	And I filled the form
	When I click on "Salva cambiamenti"
	Then I should be on rate score page again
