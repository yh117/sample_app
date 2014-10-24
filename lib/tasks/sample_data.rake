namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do

		User.create!(name: "Yebin Han",
			email: "xyz110119120@gmail.com",
			password: "19871228",
			password_confirmation: "19871228")

		user = User.first

		50.times do
			name = Faker::Lorem.sentence(5)
			user.books.create!(name: name)
		end
	end
end