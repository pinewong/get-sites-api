##
# User authorization, get access token.
# @author PineWong
#
class V1::AuthorizationsController < V1::ApplicationController
  before_action :authenticate!, except: [:create]

  ##
  # Create a access token
  #   POST /v1/authorizations
  #
  # @param email [String] the user email
  # @param password [String] the user password
  #
  # @return [User] the token
  # 
  def create
    # Blank Email/Password
    if params[:user].blank? || 
        params[:user][:email].blank? ||
        params[:user][:password].blank?
      
      render json: { error: 'Blank Email/Password!' }, status: :bad_request        
      return
    end
    
    @user = User.find_by(email: params[:user][:email])
  
    # Invalid Email/Password
    if !@user || !@user.valid_password?(params[:user][:password])
      render json: { error: "Invalid Email/Password!" }, status: :unauthorized        
      return
    end

    render json: access_token, status: :created
  end

  private

  ##
  # Get access token data structure
  #
  # @return [Json] the token
  #   {
  #     access_token: JsonWebToken.encode({ user_id: @user.id }),
  #     user: {
  #       id: @user.id,
  #       email: @user.email
  #     }
  #   }
  #
  def access_token
    {
        access_token: JsonWebToken.encode({ user_id: @user.id }),
        user: {
            id: @user.id,
            email: @user.email
        }
    }
  end
end
