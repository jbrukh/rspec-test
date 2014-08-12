require 'rails_helper'

describe User, :type => :model do

	it "has a name" do
		u = User.new
		expect(u).not_to be_valid
		expect(u.errors[:name]).not_to be_nil
	end

end
