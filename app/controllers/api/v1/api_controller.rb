module Api
  module V1
    class ApiController < ActionController::API
      include Authenticator # refactor code, use jwt_sessions gem instead
      before_action :set_current_user
      # before_action :authenticate_access_request!

      def current_user
        @current_user
      end
    end
  end
end
