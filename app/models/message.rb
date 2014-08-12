class Message < ActiveRecord::Base
	belongs_to :user
	belongs_to :recipient
	validates :content, presence: true, length: {minimum: 5}
end
