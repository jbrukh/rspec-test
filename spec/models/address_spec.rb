require 'rails_helper'

RSpec.describe Address, :type => :model do

  it "has a valid factory" do
  	expect(build(:address)).to be_valid
  end

  it "is invalid without required attributes" do
  	%w(city state zip).each do |attr|
  		a = build(:address, attr => nil)
  		expect(a).not_to be_valid
  		expect(a.errors[attr]).not_to be_nil
  	end
  end

  it "is created successfully when given valid attributes" do
  	expect {
  		create(:address)
  	}.to change(Address, :count).by(1)
  end

end
