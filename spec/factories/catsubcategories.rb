FactoryGirl.define do
	# category = FactoryGirl.create(:category)
	# subcategory = FactoryGirl.create(:subcategory)
	factory :catsubcategory do
		category_id 1
		subcategory_id 1
		menu_show 1
		priority 1
		# created_at
	end
end