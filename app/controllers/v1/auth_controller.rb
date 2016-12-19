module V1
  class AuthController < ApplicationController
    before_action :authenticate!, except: [:index, :create]

    def index
      render plain: 'auth#index'
    end
    
    def update
      render plain: 'auth#update'
    end
    
    def create
      @user = User.find_by(email: params[:user][:email])
    
      # Invalid Useremail/Password
      if !@user || !@user.valid_password?(params[:user][:password])
        return render json: { error: "Invalid Useremail/Password" }, status: :unauthorized
      end

      render json: access_token, status: :created
    end

    private
      ##
      # Get access token data structure
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
  end # Class AuthController
end # Module V1
