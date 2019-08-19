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
	end

	def create
		answer=Answer.new(answer_params)
		answer.test=@test
		answer.save
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
