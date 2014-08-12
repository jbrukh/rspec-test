require 'rails_helper'

RSpec.describe Address, :type => :model do

  before(:each) do
  	@valid_attributes = {
  		:city => 'New York'
  		:state => 'NY'
  		:zip => 11222
  	}
  end

  it "should be able to be created with valid attributes" do
  	expect {
  		Address.create!(@valid_attributes)
  	}.to change(Address, :count).by(1)
  end

  it "must have a city" do
  	a = Address.new
  	expect(a.errors.on(:city)).not_to be_nil
  end

  it "must have a state" do
  	a = Address.new
  	expect(a.errors.on(:state)).not_to be_nil
  end

  it "must have a zip" do
  	a = Address.new
  	expect(a.errors.on(:zip)).not_to be_nil
  end

end