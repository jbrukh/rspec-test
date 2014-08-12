require 'rails_helper'

RSpec.describe Message, :type => :model do

	before(:each) do
		@valid_attributes = {
			:user_id => 1,
			:recipient_id => 2,
			:content => 'Hello, this is it.'
		}
	end

	it "can be created with valid attributes" do
		expect {
			Message.create!(@valid_attributes)
		}.to change(Message, :count).by(1)
	end

	describe "Content" do
		it "is required" do
			m = Message.new(@valid_attributes.except(:content))
			expect(m).not_to be_valid
			expect(m.errors[:content]).not_to be_nil
		end
		it "is at least 5 characters long" do
			m = Message.new(:user_id => 1, :recipient_id => 2, :content => 'abc')
			expect(m).not_to be_valid
			expect(m.errors[:content]).not_to be_nil
		end
	end

	describe "Associations" do
		it "belongs to a user" do 
			expect(Message.new).to respond_to(:user)
		end
		it "has a recipient user" do
			expect(Message.new).to respond_to(:recipient)
		end
	end
end
