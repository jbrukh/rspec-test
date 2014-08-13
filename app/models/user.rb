class User < ActiveRecord::Base
	has_many :messages
	validates :name, 
				presence: true, 
				length: { minimum: 3, maximum: 16 },
				uniqueness: true
end
