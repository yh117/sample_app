FactoryGirl.define do
	factory :user do
		name     "Michael Hartl"
    	email    "michael@example.com"
    	password "foobar"
    	password_confirmation "foobar"
    end


    factory :book do
    	name "Lorem ipsum"
    	user
    end
end