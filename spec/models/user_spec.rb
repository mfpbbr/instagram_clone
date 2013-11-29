require 'spec_helper'
  
describe User do
 it { should have_many :photos }
  let(:user){FactoryGirl.create(:user)}
  let(:photo){FactoryGirl.create(:photo)}
  it "should show likes for a photo" do

end