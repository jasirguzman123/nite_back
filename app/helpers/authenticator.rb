module Authenticator
  def simple_authentication(email, password)
    user = User.find_by(email: email)
    user if user.present? && user.authenticate(password)
  end

  def set_current_user
    get_current_user request.headers['Authorization']
  end

  def get_current_user(token)
    return invalid_token unless token.present?
    
    payload = decode_jwt(token)
    invalid_token if payload.blank?
    expired_token if expired_token?(payload)
    @current_user = User.find_by(id: payload[:user_id])
    user_not_found if @current_user.blank?
    @current_user
  end

  def encode_jwt(user)
    payload = {
      user_id: user.id,
      exp: 1.days.from_now.to_i
    }
    JWT.encode(payload, hmac_secret)
  end

  def decode_jwt(token)
    payload = JWT.decode(token, hmac_secret) rescue nil
    payload&.first&.with_indifferent_access
  end

  private

  def hmac_secret
    Rails.application.credentials.secret_key_base
  end

  def expired_token?(payload)
    Time.at(payload['exp']) < Time.now
  end

  def invalid_token
    render_unauthorized('invalid token')
  end

  def expired_token
    render_unauthorized('expired token')
  end

  def user_not_found
    render_unauthorized('user not found')
  end

  def render_unauthorized(message = 'Unauthorized')
    render json: { error: message }, status: :unauthorized
  end
end
