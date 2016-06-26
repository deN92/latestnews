class StatsUsersSign < ActiveRecord::Base

	def self.add_count_sign_in
		select_user_today = User.where("current_sign_in_at LIKE ?", "%#{DateTime.now.strftime("%Y-%m-%d")}%")
		self.create(:date_sign_in => DateTime.now.strftime("%Y-%m-%d"), :count_sign_in => select_user_today.count) if self.count == 0

		if(DateTime.now.strftime("%Y-%m-%d") != self.last.date_sign_in.strftime("%Y-%m-%d"))
			self.create(:date_sign_in => DateTime.now.strftime("%Y-%m-%d"), :count_sign_in => select_user_today.count)
		end	
		if((DateTime.now.strftime("%Y-%m-%d") == self.last.date_sign_in.strftime("%Y-%m-%d")) && (select_user_today.count != self.last.count_sign_in))
			self.last.update_attribute(:count_sign_in, select_user_today.count)
		end
	end 

end