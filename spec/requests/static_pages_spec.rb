require 'spec_helper'

describe "Static pages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_content(heading) }
    it { should have_title(full_title(page_title)) }
  end



  describe "Home page" do

    before { visit root_path }

    let(:heading)    { 'book list app' }
    let(:page_title) { 'Home' }

    it_should_behave_like "all static pages"
  end



  describe "Help page" do

    before { visit help_path }

    let(:heading)    { 'Help' }
    let(:page_title) { 'Help' }

    it_should_behave_like "all static pages"
  end





  describe "About page" do

    before { visit about_path }

    let(:heading)    { 'About us' }
    let(:page_title) { 'About us' }

    it_should_behave_like "all static pages"
  end




  describe "Contact page" do

    before { visit contact_path }


    let(:heading)    { 'Contact' }
    let(:page_title) { 'Contact' }

    it_should_behave_like "all static pages"
  end



  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    expect(page).to have_title(full_title('About us'))
    click_link "Help"
    expect(page).to have_title(full_title('Help'))
    click_link "Contact"
    expect(page).to have_title(full_title('Contact'))
    click_link "Home"
    click_link "Sign up now!"
    expect(page).to have_title(full_title('Sign up'))
    click_link "book list app"
    expect(page).to have_title(full_title('Home'))
  end

  describe "for signed-in users" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      FactoryGirl.create(:book, user: user, name: "Lorem ipsum")
      FactoryGirl.create(:book, user: user, name: "Dolor sit amet")
      sign_in user
      visit root_path
    end

    it "should render the user's feed" do
      user.feed.each do |item|
        expect(page).to have_selector("li##{item.id}", text: item.name)
      end
    end
  end


end
