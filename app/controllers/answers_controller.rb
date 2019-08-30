class AnswersController < ApplicationController
	before_action :set_test, only:[:new]
	
	def new
		@questions=@test.questions.shuffle
   if @questions.empty?
     redirect_to submit_test_path(@test)
     return 
   end
		@answer=Answer.new
		@answer.question=@questions.first
		@answer.test=@test
		@answer.save
	end

	def update
		answer=Answer.find(params[:id])
		answer.update(answer_params)
		redirect_to answer_path(answer.test)
	end

	private
		def set_test
			@test=Test.find(params[:id])
		end

		def answer_params
			params.require(:answer).permit(:question_id,:option_ids=>[])
		end
end
