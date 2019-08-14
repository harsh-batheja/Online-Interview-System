class AnswersController < ApplicationController
	before_action :set_paper
	
	def new
		#binding.pry
		@questions=@paper.questions.paginate(page:params[:page],per_page: 1)
		@answer=Answer.new
		@answer.question=@questions.first
	end

	def create
		answer=Answer.new(answer_params)
		answer.user=current_user
		# binding.pry
		answer.save
		redirect_to new_paper_answer_path(@paper)
	end

	private

		def set_paper
			@paper=Paper.find(params[:paper_id])
		end

		def answer_params
			params.require(:answer).permit(:question_id,:option_ids=>[])
		end
end
