class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy,:submit]

  def index
    @tests = current_user.tests
  end

  def show
  end

  def new
    @test = Test.new
    @test.paper_id=params[:id]
  end

  def create
    @test = Test.new(test_params)
    @test.user=current_user
    respond_to do |format|
      if @test.save
        session[:test_id]=@test.id
        format.html { redirect_to answer_path(@test) }
        format.json { render :show, status: :created, location: [:admin,@test] }
      else
        format.html { render :new }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  def submit
    respond_to do |format|
      if @test.calc_marks
        session[:test_id]=nil
        format.html { redirect_to @test, notice: 'Your Test has Ended.' }
        format.json { render :show, status: :created, location: @test }
      end
    end
  end

  private
    def set_test
      @test = Test.find(params[:id])
    end

    def test_params
      params.require(:test).permit(:paper_id,:user_id,:marks)
    end
end