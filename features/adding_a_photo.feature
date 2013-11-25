Feature: Photos
	In order to store my photos
	As a person who bums my photos
	I want to be able to show my photos to the world

	Background: 
		Given I am on the homepage

	Scenario: Adding photos
		When I click "Add Photo"
    And I upload the photo
		Then I should see a photo on the homepage
	
  Scenario: Edit photo
    When I click "Edit" on my "My little dick"
    And I change the caption to "My big dick"
    Then I should see "My big dick"

    