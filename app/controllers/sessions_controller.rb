class SessionsController < ApplicationController
  include JwtHelper
  def google_auth
    user_info = request.env['omniauth.auth']
    @user = User.find_or_create_by(email: user_info.info.email) do |user|
      user.name = user_info.info.name
      user.image = user_info.info.image
    end

    payload = {user_id: @user.id}
    token = JwtHelper.encode_token(payload)

    render json: {token: token}, status: :ok
  end

  def google_sign_in
    redirect_to '/auth/google_oauth2'
  end

end
