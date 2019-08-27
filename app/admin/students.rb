ActiveAdmin.register Student do

  permit_params :first_name, :last_name, :dob, :gender, :blood_group, :status, :school_class_id

  filter :by_name_search_in,as: :string, label: "Name"

  batch_action :destroy, false

  index do
    selectable_column
    column :first_name
    column :last_name
    column :dob
    column :gender
    column :blood_group
    column :status
    column :school_class
    column :view_marks do |student|
      link_to "View marks", admin_subject_marks_path(student_id: student.id)
    end
    actions
  end

  batch_action :delete_selected_students do |ids|
    batch_action_collection.find(ids).each do |student|
      student.delete
    end
    redirect_to admin_students_path, success: "The selected student records have been deleted."
  end
end
