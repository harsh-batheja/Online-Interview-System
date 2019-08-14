module AnswersHelper
	def answered?(question_id)
		Answer.find_by(user_id:current_user.id,question_id:question_id)!=nil
	end
end
