class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :omniauthable, omniauth_providers: [:github, :google_oauth2], authentication_keys: [:login]
  has_many :properties
  has_many :locations, through: :properties
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  attr_writer :login

  def login
    @login || self.username || self.email
  end
  
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
    user.username = provider_data.info.name
    user.email = provider_data.info.email
    user.password = Devise.friendly_token[0,20]
    end
  end

end
