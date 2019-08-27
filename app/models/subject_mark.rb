class SubjectMark < ApplicationRecord
	belongs_to :subject
	belongs_to :student

  enum status: [:active, :inactive]
	validates :marks, :status, presence: true
end
