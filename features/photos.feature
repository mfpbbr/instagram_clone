Feature: Photos
	In order to store my photos
	As a person who bums my photos
	I want to be able to show my photos to the world

	Background: 
	  Given I am on the homepage

	@javascript
	Scenario: Adding photos
	  Given I have logged in
	  When I click "Add Photo"
      Then I upload a photo
	  Then I should see a photo on the homepage
	
	Scenario: Edit photo
	  Given I have logged in
	  And I have uploaded a photo with caption "Awesome" and tags "#selfie #yolo"
	  When I edit the photo and fill in "Caption" with "Salami" within ".edit_caption"
	  Then I should see "Salami"

	Scenario: Delete photo
	  Given I have logged in
	  Given I have uploaded a photo with caption "Awesome" and tags "#selfie #yolo"
	  When I delete the photo
	  Then I should not see "Awesome"

	Scenario: Showing the user who posted the photo
	  Given I have logged in
	  And I have uploaded a photo with caption "Awesome" and tags "#selfie #yolo"
	  Then I should see "james@me.com"

	Scenario: Harshtags
		Given I have logged in
		Given I have uploaded a photo with caption "Blue Jeans" and tags "#cheap #nasty"
		Then I should see "#cheap #nasty"

	Scenario: Likes
		Given I have logged in
		And I have uploaded a photo with caption "Blue Jeans" and tags "#cheap #nasty"
		When I like the photo with caption "Awesome"
		Then the photo has one like

