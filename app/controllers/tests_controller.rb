class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]

  def index
    @tests = Test.all
  end

  def show
  end

  def new
    @test = Test.new
    @test.paper_id=params[:paper_id]
  end

  def edit
  end

  def create
    @test = Test.new(test_params)
    @test.user=current_user
    respond_to do |format|
      if @test.save
        format.html { redirect_to new_test_answer_path(@test) }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to @test, notice: 'Test was successfully updated.' }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @test.destroy
    respond_to do |format|
      format.html { redirect_to tests_url, notice: 'Test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def submit
    @test=Test.find(params[:test_id])
    respond_to do |format|
      if @test.calc_marks
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