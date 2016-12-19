module V1
  class ApplicationController < ActionController::API
    
    
    protected
      ##
      # API authenticate
      # The authencication by http header or 'access_token' parameter
      #
      def authenticate!
        unless user_id_in_token?
          render json: { :error => 'Not Authenticated'}, status: :unauthorized
          return
        end
        @current_user = User.find(auth_token[:user_id])
      rescue JWT::VerificationError, JWT::DecodeError
        render json: { :error => 'Not Authenticated'}, status: :unauthorized
      end

      private

      ##
      # Get access token from header or params['access_token']
      #
      def http_token
        @http_token ||= if request.headers['Authorization'].present?
                          request.headers['Authorization'].split(' ').last
                        elsif request.params['token'].present?
                          request.params['token']
                        end
      end

      ##
      # JSONWebtoken decode access token to user id
      #
      def auth_token
        @auth_token ||= JsonWebToken.decode(http_token)
      end

      def user_id_in_token?
        http_token && auth_token && auth_token[:user_id].to_i
      end
  end # Class AppicationController
end
