class CreateSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects do |t|
    	t.string :name, unique: true, index: true
    	t.integer :status, index: true
    	t.references :school_class

      t.timestamps
    end
  end
end
