class Option < ApplicationRecord
	belongs_to :question
	has_one :answer_option
	has_many :answers, through: :answer_option
	has_one :paper, through: :question
end