ActiveAdmin.register SubjectMark do

  permit_params :student_id, :marks, :status, :subject_id

  controller do
    def scoped_collection
      if params[:action] == 'index' && params[:student_id]
        super.where("student_id = ?", params[:student_id])
      else
        super
      end
    end
  end

  index do
    selectable_column
    column :name do |mark|
      student = mark.student
      "#{student.first_name} #{student.last_name}"
    end
    column :subject
    column :marks
    actions
  end

  form do |f|
    f.inputs do
      f.input :subject
      f.input :student_id, label: 'Student', as: :select, collection: Student.all.map{|student| ["#{student.last_name} #{student.first_name}", u.id]}
      f.input :marks
      f.input :status
      f.submit
    end
  end
  
end
