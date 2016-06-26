FactoryGirl.define do
	factory :article do
        category_id 1
        subcategory_id 1
        region_id 1
        sequence(:tittle){ |i| "article#{i}_test1" }
        article_link "article_test1article1_test1_body1"
        body "article1_test1_body1article1_test1_body1article1_test1_body1"
        count_comments 1
	end
end