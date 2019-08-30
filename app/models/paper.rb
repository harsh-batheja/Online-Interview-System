class Paper < ApplicationRecord
	has_many :questions, dependent: :destroy
	has_many :test, dependent: :destroy
	accepts_nested_attributes_for :questions, allow_destroy: true, reject_if: Proc.new{ |attr| attr['question'].blank? }

	def user_tests(user)
		test.where(user: user)
	end
end
