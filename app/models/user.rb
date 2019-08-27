class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :authentication_keys => [:mobile_number]

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def admin?
  	false
  end
end
