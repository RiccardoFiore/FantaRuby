class User < ApplicationRecord

  has_one :league
  has_many :formazionis
  has_one :rose

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :twitter]


  validates_uniqueness_of :username
  validates :username, :case_sensitive => false

  #Canard roles:

  acts_as_user :roles => [:loggedin, :president, :player, :admin ]


  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
          user.email = auth.info.email
          user.password = Devise.friendly_token[0,20]
      end
  end


  def self.new_with_session(params, session)
      super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
          user.email = data["email"] if user.email.blank?
      end
      end
  end




end
