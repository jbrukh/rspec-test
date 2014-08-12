require 'rails_helper'

RSpec.describe Message, :type => :model do

	@valid_attributes = {
		:user_id => 1,
		:recipient_id => 2,
		:content => 'Hello, this is it.'
	}

	it "can be created with valid attributes" do
		expect {
			Message.create!(@valid_attributes)
		}.to change(Message, :count).by(1)
	end

	it "has non-trivial content"

	describe "Associations" do
		it "belongs to a user" do 
			expect(Message.new).to respond_to(:user)
		end
		it "has a recipient user" do
			expect(Message.new).to respond_to(:recipient)
		end
	end
end
