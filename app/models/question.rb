class Question < ApplicationRecord
	belongs_to :paper
	has_many :ans, dependent: :destroy, class_name: "Answer"
	has_many :options, dependent: :destroy
	accepts_nested_attributes_for :options, allow_destroy: true, reject_if: Proc.new{ |attr| attr['option'].blank? }

	def user_answers(user)
		ans.where(user:user)
	end

	def answers
		options.where("is_correct = ?",true)
	end

	def hours
		duration/3600
	end

	def minutes
		(duration%3600)/60
	end

	def seconds
		duration%60
	end

	def hours=(hour)
		self.duration=hour.to_i*3600+minutes*60+seconds
	end

	def minutes=(minute)
		self.duration=hours*3600+minute.to_i*60+seconds
	end

	def seconds=(second)
		self.duration=hours*3600+minutes*60+second.to_i
	end
end
