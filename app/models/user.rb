class User < ApplicationRecord
  acts_as_paranoid
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]

  # if not validateble:
  # validates :email, presence: true,
  #           format: { with: Devise.email_regexp},
  #           uniqueness: true

  def to_s
    name
  end
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      if auth.provider == 'facebook'
        user.name = auth.info.name
      elsif auth.provider == 'google_oauth2'
        user.name = auth.info.first_name + ' ' + auth.info.last_name
      end
      user.password = Devise.friendly_token[0,20]
    end
  end
end
