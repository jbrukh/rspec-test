class Message < ActiveRecord::Base
	belongs_to :user
	belongs_to :recipient, class_name: 'User', foreign_key: 'recipient_id'
	validates :content, presence: true, length: {minimum: 5}
end
