require 'spec_helper'
require 'factory_girl_rails'

describe 'my instagram clone should have an api' do
  before(:all) do
  	FactoryGirl.create_list(:photo_list, 10) 
  	get '/api/photos', {}

  	@response, @json = response, JSON.parse(response.body)
  end

  it 'should return a response' do
    expect(@response).to be_success
  end

  it 'returns a success status code' do
      expect(@json.length).to eq 10
    end

    it 'does not reveal the owner email' do
      expect(@json.last).not_to include 'email'
    end

    it 'shows the photo name' do
      expect(@json.last['caption']).to eq 'Photo'
    end
	
end