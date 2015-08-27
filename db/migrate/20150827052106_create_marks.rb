class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.references :semester, index: true
      t.references :subject, index: true
      t.references :student, index: true
      t.integer :value

      t.timestamps null: false
    end
    add_foreign_key :marks, :semesters
    add_foreign_key :marks, :subjects
    add_foreign_key :marks, :students
  end
end
