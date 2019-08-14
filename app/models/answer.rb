class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many :answer_options, dependent: :destroy
  has_many :options, through: :answer_options
  accepts_nested_attributes_for :answer_options, allow_destroy: true
  def is_correct?
  	if(question.qtype=="MCQ"||question.qtype=="MAQ")
  		q=question.answers.map(&:id)
  		o=options.map(&:id)
  		return ((o-q).empty? && (q-o).empty?)
  	else 
      return false
    end
  end

  def marks
    if options==[]
      return question.unattempted
    elsif is_correct?
      return question.correct
    else
      return question.incorrect
    end
  end
end
