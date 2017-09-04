class User < ApplicationRecord  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
       
  devise :omniauthable, omniauth_providers: [:facebook]

  has_one :profile
  has_many :requisitions, through: :profile

  validates :name, presence: true
  validates :name, uniqueness: {
    scope: [:email], 
    case_sensitive: false }

  validates :email, presence: true

  validates :password, presence: true
  
  validates :password_confirmation, presence: true
  
  def self.from_omniauth(auth)    
    logger.info("auth #{auth}")
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|      
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.password_confirmation = user.password
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image     
    end
  end
end
