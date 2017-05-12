class Post < ApplicationRecord
	has_many :projects, dependent: :destroy
	has_many :qualifications, dependent: :destroy
	has_many :recommendations, dependent: :destroy
	has_many :experiences, dependent: :destroy
	has_many :others, dependent: :destroy
	has_many :skills, dependent: :destroy 
	belongs_to :post
	validates :first_name, :last_name, :category, :about, presence: true

	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/


	accepts_nested_attributes_for :projects, :recommendations, :experiences, :qualifications, :skills, :others, allow_destroy: true

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
