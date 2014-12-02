class User < ActiveRecord::Base
	require 'digest/md5'
	#attr_accessible :name, :password, :password_confirmation
	before_save :encrypt_password

	validates :name,
						:presence => TRUE,
						:length =>
								{
										:minimum => 4,
										:allow_blank => TRUE
								}

	validates :password,
						:presence => TRUE,
						:length =>
								{
										:minimum => 6,
										:allow_blank => TRUE
								},
						:confirmation => TRUE

	validates :password_confirmation,
						:presence => TRUE


	def encrypt_password
		self.password = Digest::MD5.hexdigest(password)
	end


#Define the validate_login method used in the controller.
#1) Get users name by (querying the database?)
#2) Compare the input to the user and the users MD5-hasehd password


	def self.validate_login(name,password)
		user = User.find_by_name(name)
		if user && user.password == Digest::MD5.hexdigest(password)
			user
		else
			nil
		end
	end

end
