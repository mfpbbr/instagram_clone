Given(/^I am on the homepage$/) do
	visit '/'
end

Given(/^I click "(.*?)"$/) do |link|
	click_link(link)
end

Then(/^I should see "(.*?)"$/) do |text|
	page.should have_content(text)
end

When(/^I upload the photo$/) do
	fill_in 'Caption', with: 'my first photo'
	fill_in 'Tags', with: 'awesome'
	click_button 'Upload' 
end

Then(/^I should see a photo on the homepage$/) do
	page.should have_css(".instagram_image")
end

Given(/^I have uplodaed a photo with caption "(.*?)" and tags "(.*?)"$/) do |caption, tags|
  FactoryGirl.create(:photo)
  visit '/photos'
  current_path = URI.parse(current_url).path
  current_path.should == '/photos'
  page.should have_content 'Edit'
end

When(/^I edit the caption to "(.*?)"$/) do |caption|
  click_link 'Edit'
  fill_in 'Caption', with: caption
  click_button 'Update'
end

When(/^I delete the photo$/) do
  click_link 'Delete'
end

Then(/^I should not see "(.*?)"$/) do |caption|
	page.should_not have_content caption
end
