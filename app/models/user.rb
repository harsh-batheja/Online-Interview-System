class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  has_many :tests
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable, :trackable

  def admin?
    admin
  end

  def update_with_password(params={})
    if params[:current_password].blank? and params[:password_confirmation].blank? and params[:password].blank?
      params.delete(:current_password)
      self.update_without_password(params)
    else
      self.verify_password_and_update(params)
    end
  end
 
  def update_without_password(params={})
    params.delete(:password)
    params.delete(:password_confirmation)
    result = update_attributes(params.permit(:fname,:lname))
    clean_up_passwords
    result
  end
  def verify_password_and_update(params)
    current_password = params.delete(:current_password)
    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end
    result = if valid_password?(current_password)
      update_attributes(perms(params))
    else
      self.attributes = perms(params)
      self.valid?
      self.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
      false
    end
    clean_up_passwords
    result
  end
  private
  	def perms(params)
  		params.permit(:current_password,:lname,:fname,:password,:password_confirmation)
  	end
end
