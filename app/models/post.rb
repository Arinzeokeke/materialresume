class Post < ApplicationRecord
	has_many :projects, dependent: :destroy
	has_many :qualifications, dependent: :destroy
	has_many :recommendations, dependent: :destroy
	has_many :experiences, dependent: :destroy 
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true
	validates :category, presence: true

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
	validates :email, 
	:presence => true,
	:length => { :maximum => 100 },
	:format => EMAIL_REGEX,
	:confirmation => true

	def full_name
		"#{self.first_name} #{self.last_name}"
		
	end
	
end
