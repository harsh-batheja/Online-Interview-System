class ApplicationController < ActionController::Base
	before_action :authenticate_user!

	private
		def require_admin
			unless current_user.admin
				redirect_to user_path(current_user)
			end
		end
	def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
