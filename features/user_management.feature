Feature: User management
	In order to view my photos
	As a person who loves my photos
	I want to be able to sign up

	Background: 
		Given I am on the homepage

	Scenario: Sign up
		Given I click "Register"
		Then I should see "Sign up" 
