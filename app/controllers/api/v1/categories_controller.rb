class Api::V1::CategoriesController < Api::V1::ApiController
  skip_before_action :set_current_user

  def index; end
end
