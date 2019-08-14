class Paper < ApplicationRecord
	has_many :questions, dependent: :destroy
	accepts_nested_attributes_for :questions, allow_destroy: true, reject_if: Proc.new{ |attr| attr['question'].blank? }
end
