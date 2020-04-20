class Api::V1::EventParticipationsController < Api::V1::ApiController
  def index
    participations
  end

  private

  def participations
    @participations ||= @current_user.event_participations
  end
end
