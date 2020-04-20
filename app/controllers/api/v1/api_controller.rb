module Api
  module V1
    class ApiController < ActionController::API
      include Authenticator
      before_action :set_current_user
    end
  end
end