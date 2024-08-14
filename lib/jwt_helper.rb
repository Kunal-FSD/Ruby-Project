# lib/jwt_helper.rb
require 'jwt'

module JwtHelper
  SECRET_KEY = Rails.application.secrets.secret_key_base.to_s

  def self.encode_token(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode_token(token)
    begin
      decoded = JWT.decode(token, SECRET_KEY)[0]
      HashWithIndifferentAccess.new (decoded)
    rescue JWT::DecodeError => e
      nil
    end
  end
end
