class Admin::ApplicationController < ActionController::Base
	before_action :authenticate_user!
  layout 'application'

	private
	def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.admin?
    	admin_root_path
    else
    	super
    end
  end
end
