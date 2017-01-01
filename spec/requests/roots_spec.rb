require 'rails_helper'

RSpec.describe "Roots", type: :request do
  describe "index" do
    it 'responds correct status' do
      get '/'
      expect(response).to have_http_status :found
    end
    
    # it "displays the user's username after successful login" do
    #   user = User.create!(:username => "jdoe", :password => "secret")
    #   get "/login"
    #   assert_select "form.login" do
    #     assert_select "input[name=?]", "username"
    #     assert_select "input[name=?]", "password"
    #     assert_select "input[type=?]", "submit"
    #   end
    #
    #   post "/login", :username => "jdoe", :password => "secret"
    #   assert_select ".header .username", :text => "jdoe"
    # end
    #
    # it "displays the user's username after successful login" do
    #   user = FactoryGirl.create(:user, :username => "jdoe", :password => "secret")
    #   visit "/login"
    #   fill_in "Username", :with => "jdoe"
    #   fill_in "Password", :with => "secret"
    #   click_button "Log in"
    #
    #   expect(page).to have_selector(".header .username", :text => "jdoe")
    # end
  end
end
