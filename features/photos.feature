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
    Given I have uplodaed a photo with caption "Awesome" and tags "selfie yolo"
    When I edit the caption to "Salami"
    Then I should see "Salami"

  Scenario: Delete photo
    Given I have uplodaed a photo with caption "Awesome" and tags "selfie yolo"
    When I delete the photo
    Then I should not see "Awesome"

