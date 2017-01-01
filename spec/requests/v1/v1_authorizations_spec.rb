require 'rails_helper'

RSpec.describe "V1::Authorizations", type: :request do
  describe "create" do
    it "responds correct status" do
      post '/v1/authorizations'
      expect(response).to have_http_status :bad_request
      
      params = {
        "user": {
          "email": "invalid@a.com",
          "password": "password"
        }
      }      
      post '/v1/authorizations', params: params, as: :json
      expect(response).to have_http_status :unauthorized
        
      params = {
        "user": {
          "email": "admin@get-sites.com",
          "password": "password"
        }
      }      
      post '/v1/authorizations', params: params, as: :json
      expect(response).to have_http_status :created
      
      
      # get v1_authorizations_index_path
      # expect(response).to have_http_status(200)
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
