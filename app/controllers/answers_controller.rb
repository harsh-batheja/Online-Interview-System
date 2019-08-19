class AnswersController < ApplicationController
	before_action :set_test, only:[:new,:create]
	
	def new
		@questions=@test.questions.shuffle
   if @questions.empty?
     redirect_to test_submit_path(@test)
     return 
   end
		@answer=Answer.new
		@answer.question=@questions.first
		@answer.test=@test
		@answer.save
	end

	def create
		answer=Answer.find_by(test_id: @test.id,question_id: answer_params[:question_id])
		answer.update(answer_params)
		redirect_to new_test_answer_path(@test)
	end

	private
		def set_test
			@test=Test.find(params[:test_id])
		end

		def answer_params
			params.require(:answer).permit(:question_id,:option_ids=>[])
		end
end
