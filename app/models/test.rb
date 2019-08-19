class Test < ApplicationRecord
  belongs_to :paper
  belongs_to :user
  has_many :answers, dependent: :destroy
  
  def questions
  	paper.questions-answers.map{|answer| answer.question}
  end

  def calc_marks
  	self.marks = answers.reduce(0){|sum, answer| sum + answer.marks}
    save
  end
end
