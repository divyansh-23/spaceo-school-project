class SchoolClass < ApplicationRecord
	has_many :students
	has_many :subjects

	enum status: [:active, :inactive]
end
