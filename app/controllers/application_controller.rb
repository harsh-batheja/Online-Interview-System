class ApplicationController < ActionController::Base
	before_action :authenticate_user!
  before_action :continue_test,except:[:submit]
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
  
  def continue_test
    if session[:test_id] != nil && answer_path(session[:test_id]) != request.env['PATH_INFO']
      redirect_to answer_path(session[:test_id])
    end
  end
end
