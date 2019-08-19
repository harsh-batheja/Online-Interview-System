class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]
  #before_action :require_admin, only:[:index,:edit,:destroy]

  def index
    @tests = Test.all
  end

  # GET /tests/1
  # GET /tests/1.json
  def show
  end

  # GET /tests/new
  def new
    @test = Test.new
    @test.paper_id=params[:paper_id]
  end

  # GET /tests/1/edit
  def edit
  end

  # POST /tests
  # POST /tests.json
  def create
    @test = Test.new(test_params)
    @test.user=current_user
    respond_to do |format|
      if @test.save
        format.html { redirect_to new_test_answer_path(@test), notice: 'Your Test has Started.' }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1
  # PATCH/PUT /tests/1.json
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

  # DELETE /tests/1
  # DELETE /tests/1.json
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
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_params
      params.require(:test).permit(:paper_id,:user_id,:marks)
    end
end
