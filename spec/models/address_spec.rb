require 'rails_helper'

RSpec.describe Address, :type => :model do

  before(:each) do
  	@valid_attributes = {
  		:city => 'New York',
  		:state => 'NY',
  		:zip => 11222
  	}
  end

  it "should be able to be created with valid attributes" do
  	expect {
  		Address.create!(@valid_attributes)
  	}.to change(Address, :count).by(1)
  end

  it "must have a city" do
  	a = Address.new(:state => 'NY', :zip => 11222)
  	expect(a).not_to be_valid
  end

  it "must have a state" do
  	a = Address.new(:city => 'New York', :zip => 11222)
  	expect(a).not_to be_valid
  end

  it "must have a zip" do
  	a = Address.new(:city => 'New York', :state => 'NY')
  	expect(a).not_to be_valid
  end

end
