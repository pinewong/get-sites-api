
require 'jwt'

class JsonWebToken
  def self.encode(payload, expiration = 2500.hours.from_now)
    payload['exp'] = expiration.to_i # Set expiration to 24 hours.
    JWT.encode(payload, Rails.application.secrets.secret_key_base, 'none')
  end

  def self.decode(token)
    begin
      payload =JWT.decode(token, Rails.application.secrets.secret_key_base, false)
      return HashWithIndifferentAccess.new(payload[0])
    rescue
      nil
    end
  end
end
