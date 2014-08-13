require 'rails_helper'

describe User, :type => :model do

	it "has a valid factory" do
		expect(build(:user)).to be_valid
	end

	it "is invalid without a name" do
		expect(build(:user, :name => nil)).not_to be_valid
	end
	
	describe "creation" do
		it "succeeds with valid parameters" do
			expect {
				create(:user)
			}.to change(User, :count).by(1)
		end
		it "is invalid with duplicate name" do
			create(:user)
			expect(build(:user)).to have(1).errors_on(:name)
		end
	end

	describe "name" do
		it "is invalid when smaller than 3 characters" do
			expect(build(:user, :name => 'aa')).to have(1).errors_on(:name)
		end

		it "is invalid when larger than 16 characters" do
			expect(build(:user, :name => '12345678901234567')).to have(1).errors_on(:name)
		end
	end
end