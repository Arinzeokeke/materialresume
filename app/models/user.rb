class User < ApplicationRecord
  authenticates_with_sorcery!
  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

  validates :password, length: {minimum: 3}, if: -> {new_record? || changes[:crypted_password]}
  validates :password, confirmation: true , if: -> {new_record? || changes[:crypted_password]}
  validates :password_confirmation, presence: true, if: -> {new_record? || changes[:crypted_password]}
  validates :email, 
	:presence => true,
	uniqueness: true,
	:length => { :maximum => 100 },
	:format => EMAIL_REGEX,
	:confirmation => true


end
