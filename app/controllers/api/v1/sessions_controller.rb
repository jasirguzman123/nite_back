module Api
  module V1
    class SessionsController < ApiController
      skip_before_action :set_current_user

      def create
        if user
          token
        else
          render(json: { errors: 'Invalid credentials' }, status: :unprocessable_entity)
        end
      end

      private

      def session_params
        params.require(:credentials).permit(:email, :password)
      end

      def user
        @user ||= simple_authentication(session_params[:email], session_params[:password])
      end

      def token
        @token ||= encode_jwt(user)
      end
    end
  end
end