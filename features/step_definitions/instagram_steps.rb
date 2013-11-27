require 'uri'
require 'cgi'

module WithinHelpers
  def with_scope(locator)
    locator ? within(locator) { yield } : yield
  end
end
World(WithinHelpers)

Given(/^I am on the homepage$/) do
	visit '/'
end

Given(/^I click "(.*?)"$/) do |link|
  click_link(link)
end

Then(/^I should see "(.*?)"$/) do |text|
	page.should have_content(text)
end

Then(/^I upload a photo$/) do
  FactoryGirl.create(:photo)
  visit '/photos'
end

Then(/^I should see a photo on the homepage$/) do
	page.should have_css(".instagram_image")
end

Given(/^I have uploaded a photo with caption "(.*?)" and tags "(.*?)"$/) do |caption, tags|
  tag_array = tags.split(' ').map do |tag_text|
    FactoryGirl.create(:tag, text: tag_text)
  end
  FactoryGirl.create(:photo, caption: caption, tags: tag_array, user: FactoryGirl.create(:user, email: "james@me.com"))
  visit '/photos'
end

When(/^I edit the caption to "(.*?)"$/) do |caption|
  page.should have_content 'Edit'
  click_link 'Edit'
  fill_in 'Caption', with: caption
  click_button 'Update'
end

When /^(?:|I )edit the photo and fill in "([^\"]*)" with "([^\"]*)"(?: within "([^\"]*)")?$/ do |field, value, selector|
  click_link 'Edit'
  with_scope(selector) do
    fill_in(field, :with => value)
  end
  click_button 'Update'
end

When(/^I delete the photo$/) do
  click_link 'Delete'
end

Then(/^I should not see "(.*?)"$/) do |caption|
	page.should_not have_content caption
end

Given(/^I have logged in$/) do
  login_as FactoryGirl.create(:user)
  visit('/')
end

