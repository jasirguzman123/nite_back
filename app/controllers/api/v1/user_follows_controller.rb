module Api
  module V1
    class UserFollowsController < ApiController
      def index
        render json: { data: follows }
      end

      def create
        follow = current_user.user_follows.create!(follows)
        render json: { data: follow }
      rescue => e
        render json: { errors: e.message }, status: :unprocessable_entity
      end

      private

      def follows
        @follows ||= current_user.followees
      end

      def follow_params
        params.permit(
          :followee_id,
          :followee_type
        )
      end
    end
  end
end
