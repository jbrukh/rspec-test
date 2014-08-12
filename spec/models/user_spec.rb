require 'rails_helper'

describe User, :type => :model do

	it "has a valid factory" do
		expect(build(:user)).to be_valid
	end

	it "is invalid when missing requited attributes" do
		%w(name).each do |attr|
			assert_invalid_user(attr, nil)
		end
	end

	describe "name" do
		it "is invalid when smaller than 3 characters" do
			assert_invalid_user(:name, 'aa')
		end

		it "is invalid when larger than 16 characters" do
			assert_invalid_user(:name, '12345678901234567')
		end
	end
end

def assert_invalid_user(attr, attr_value)
	u = build(:user, attr => attr_value)
	expect(u).not_to be_valid
	expect(u.errors[attr]).not_to be_nil
end