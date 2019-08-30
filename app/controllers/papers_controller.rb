class PapersController < ApplicationController
  def index
    @papers = Paper.all
  end

  def results
  	@tests=current_user.tests.where(paper:params[:id])
  end
end