class AddAdminToAdminUser < ActiveRecord::Migration
	def change
		AdminUser.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password')
	end
end