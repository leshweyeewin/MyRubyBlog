class AdminUser < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  #def email_required?
  	#false
  #end

  #def password_required?
  	#false
  #end
end
