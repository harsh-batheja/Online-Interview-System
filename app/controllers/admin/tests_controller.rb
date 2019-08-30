class Admin::TestsController < ApplicationController
  before_action :set_user,only: [:index]
  before_action :set_paper,only: [:index]
  before_action :set_test, only: [:show, :edit, :update, :destroy]

  def index
    @tests = @user.tests
  end

  def show
  end

  def edit
    @users=User.all
  end

  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to [:admin,@test], notice: 'Test was successfully updated.' }
        format.json { render :show, status: :ok, location: [:admin,@test.user,@test] }
      else
        format.html { render :edit }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    user=@test.user
    paper=@test.paper
    @test.destroy
    respond_to do |format|
      format.html { redirect_to admin_user_paper_tests_path(user,paper), notice: 'Test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:user_id])
    end

    def set_paper
      @paper = Paper.find(params[:paper_id])
    end

    def set_test
      @test = Test.find(params[:id])
    end

    def test_params
      params.require(:test).permit(:paper_id,:user_id,:marks)
    end
end