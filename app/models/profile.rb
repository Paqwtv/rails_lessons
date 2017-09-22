class Profile < ApplicationRecord
	has_one :card
	accepts_nested_attributes_for :card, :allow_destroy => true, :reject_if => proc { |attributes| attributes['number'].blank? }

	validates :name, presence: { message: 'must be fullfil' }
end