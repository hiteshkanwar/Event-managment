class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :user_roles
  
   has_many :managers
    has_many :clients
    has_many :persons

    has_one :content

  has_many :roles, through: :user_roles


 

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

   def self.role(user)
     @role=user.roles[0].name
     return @role
  end
   
end
