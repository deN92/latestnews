FactoryGirl.define do
	factory :user do
		id 1
		email "user@ln.com"
		password "1q2w3e4r5t6y7u8i9o0pasdfghjkl"
		password_confirmation "1q2w3e4r5t6y7u8i9o0pasdfghjkl"
		sign_in_count 1
		surname "User surname"
		name "Name"
		count_posts 0
	end

end