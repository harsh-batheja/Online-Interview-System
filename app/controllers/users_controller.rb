class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :require_admin,only: [:index]

  def index
    @users = User.all
  end

  def show
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

end
