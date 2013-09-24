class User < ActiveRecord::Base
	has_many :messages

	attr_accessor :password
	before_save :encrypt_password
	validates_confirmation_of :password
	validates_confirmation_of :email
	validates_uniqueness_of  :email

	def authenticate(password)
		self.fish = BCrypt::Engine.hash_secret(password, self.salt)
	end

	private 

	def encrypt_password
		if password.present?
			self.salt = BCrypt::Engine.generate_salt
			self.fish = BCrypt::Engine.hash_secret(password, self.salt)
		end
	end

end