# class User < ActiveRecord::Base
# 	has_many :messages

# 	attr_accessor :password
# 	before_save :encrypt_password

# 	validates_confirmation_of :password
# 	# validates_confirmation_of :password, :on => :create
# 	validates_confirmation_of :email
# 	validates_uniqueness_of  :email

# 	def self.authenticate(email, password)
#     	user = User.find_by_email(email)
    
# 	    if user
# 	      password_hash = BCrypt::Engine.hash_secret(password, user.password_salt)
# 	      if user.password_hash == password_hash
# 	        return user
# 	      end
# 	    end
# 	    nil
# 	  end

# 	def encrypt_password
# 		if password.present?
# 			self.password_salt = BCrypt::Engine.generate_salt
# 			self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
# 		end
# 	end

# end

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