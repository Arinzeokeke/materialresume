class Post < ApplicationRecord
	has_many :projects, dependent: :destroy
	has_many :qualifications, dependent: :destroy
	has_many :recommendations, dependent: :destroy
	has_many :experiences, dependent: :destroy 
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true
	
end
