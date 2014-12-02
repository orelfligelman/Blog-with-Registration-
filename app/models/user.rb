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

end
