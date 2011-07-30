class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :admin, :photo
  
  # setup multiple roles
  has_and_belongs_to_many :roles
  
  has_attached_file :photo
  
  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end
  
  def all_roles
    self.roles.find(:all).collect{ |role| role.name }
  end
end
