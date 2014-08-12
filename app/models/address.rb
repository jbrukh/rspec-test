class Address < ActiveRecord::Base
	validates :city, presence: true
	validates :state, presence: true
	validates :zip, presence: true
end
