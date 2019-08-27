class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
    	t.string :first_name
    	t.string :last_name
    	t.date :dob
    	t.integer :gender
    	t.string :blood_group
    	t.integer :status, index: true
    	t.references :school_class

      t.timestamps
    end
  end
end
