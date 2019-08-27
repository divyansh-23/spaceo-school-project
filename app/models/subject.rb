class Subject < ApplicationRecord
	belongs_to :school_class
	has_many :subject_marks

  enum status: [:active, :inactive]
	validates :name, :status, presence: true
end

