class Api::V1::EventParticipationsController < Api::V1::ApiController
  def create
    participation = current_user.event_participations.build(participation_params)
    if participation.save
      render json: participation, status: :ok
    else
      render json: { errors: participation.errors.messages }
    end
  end

  def index
    participations
  end

  private

  def participations
    @participations ||= @current_user.event_participations
  end

  def participation_params
    params.require(:participation).permit(
      :event_id,
      :locality_id,
      :nature
    )
  end
end
