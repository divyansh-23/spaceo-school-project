class Student < ApplicationRecord
	belongs_to :school_class
	has_many :subject_marks
  enum status: [:active, :inactive]
  enum gender: [:male, :female]


  validates :first_name, :last_name, :dob, :gender, :blood_group, :status, presence: true



	ransacker :by_name_search, formatter: proc{ |v|
    v = v.split(' ')
    first_name = v[0]
    last_name = v[1]
    data = where("first_name LIKE '%#{first_name}%'")
    data = where("last_name LIKE '%#{first_name}%'") if data.blank?
    data = data.where("last_name LIKE '%#{last_name}%'") if last_name
    data.present? ? data.ids : nil
  } do |parent|
    parent.table[:id]
  end
end
