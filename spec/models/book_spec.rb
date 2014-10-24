require 'spec_helper'

describe Book do

	let(:user) { FactoryGirl.create(:user) }
	before do
		@book = user.books.build(name: "Lorem ipsum")
	end

	subject { @book }

	it { should respond_to(:name) }
	it { should respond_to(:user_id) }
	it { should respond_to(:user) }
	its(:user) { should eq user }

	it { should be_valid }

	describe "when user_id is not present" do
		before { @book.user_id = nil }
		it { should_not be_valid }
	end

	describe "with blank name" do
		before { @book.name = " " }
		it { should_not be_valid }
	end

	describe "with name that is too long" do
		before { @book.name = "a" * 141}
		it { should_not be_valid }
	end
end
