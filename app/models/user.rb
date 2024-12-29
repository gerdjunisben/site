class User < ApplicationRecord
  has_secure_password

  def self.from_omniauth(response)
    Rails.logger.debug { "OmniAuth Response: #{response.inspect}" }
    if response[:info][:email] == "benjamingerdjunis@gmail.com"
      user = find_or_initialize_by(email: response[:info][:email])
      unless user.persisted?
        user.uid = response[:uid]
        user.provider = response[:provider]
        user.password = SecureRandom.hex(15)
        user.save!
      end
      return user
    end
    find_by(uid: response[:uid], provider: response[:provider]) do |u|
      u.email = response[:info][:email]
      u.password = SecureRandom.hex(15) if u.new_record?
    end
  end
end
