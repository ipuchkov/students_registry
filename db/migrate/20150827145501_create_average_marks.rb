class CreateAverageMarks < ActiveRecord::Migration
  def change
    create_table :average_marks do |t|
      t.references :semester, index: true
      t.references :student, index: true
      t.decimal :value, precision: 3, scale: 2, default: 0
      t.integer :subject_count, default: 0

      t.timestamps null: false
    end
    add_foreign_key :average_marks, :semesters
    add_foreign_key :average_marks, :students
  end
end
