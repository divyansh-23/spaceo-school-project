class CreateSubjectMarks < ActiveRecord::Migration[5.1]
  def change
    create_table :subject_marks do |t|
			t.integer :marks
			t.integer :status, index: true
			t.references :subject
			t.references :student
      t.timestamps
    end
  end
end
