require 'rails_helper'

describe User, :type => :model do

	it "has a valid factory" do
		expect(build(:user)).to be_valid
	end

	describe "Attributes" do
		it "is invalid without required attributes" do
			%w(name).each do |attr|
				u = build(:user, attr => nil)
				expect(u).not_to be_valid
				expect(u.errors[attr]).not_to be_nil
			end
		end
	end
end
