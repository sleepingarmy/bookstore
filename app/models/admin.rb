class Admin < ActiveRecord::Base

	has_secure_password

	validates :username, length: {minimum: 5}, presence: true, uniqueness: true
	
end
