class Question < ApplicationRecord
	belongs_to :paper
	has_many :options, dependent: :destroy
	accepts_nested_attributes_for :options, allow_destroy: true
	before_save :finalize_question
	attr_accessor :hours
	attr_accessor :minutes
	attr_accessor :seconds

	def answers()
		options.where("is_correct = ?",true)
	end

	def initialize(params)
		super
		if(params==nil)
			temp=self.duration
			@hours=temp%60
			temp=temp/60
			@minutes=temp%60
			temp=temp/60
			@seconds=temp%60
		else
			minutes=params[:hours].to_i*60+params[:minutes].to_i
			self.duration=minutes*60+params[:seconds].to_i
		end
	end

	def finalize_question
		if(self.qtype=="Fill in the Blank")
			binding.pry
		end
	end
end
