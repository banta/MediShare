class User < ActiveRecord::Base
  after_create :user_role
  rolify
  has_one :health_facility
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  before_save :ensure_authentication_token

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :role, :authentication_token
  attr_accessor :role

  private
  def user_role
  	if role == "user"
  		self.add_role :user
  		HealthFacility.create(:user_id => self.id)
  	end
  end
  
end
