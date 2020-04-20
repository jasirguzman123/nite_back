module Api
  module V1
    class UsersController < ApiController
      skip_before_action :set_current_user

      def create
        @user = User.new user_params
        if @user.save
          @token = encode_jwt(@user)
        else
          render(json: { errors: @user.errors.full_messages }, status: :unprocessable_entity) 
        end
      end

      private

      def user_params
        params.require(:user).permit(
          :name,
          :email,
          :password,
          :birthdate,
          :phone,
          :last_name
        )
      end 
    end
  end
end