require "rails_helper"

describe Article do

	it "age" do
		date = Date.new(1992, 12, 12)
		User.age(date).should == 23
	end

end