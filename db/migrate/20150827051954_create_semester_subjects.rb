class CreateSemesterSubjects < ActiveRecord::Migration
  def change
    create_table :semester_subjects do |t|
      t.references :semester, index: true
      t.references :subject, index: true

      t.timestamps null: false
    end
    add_foreign_key :semester_subjects, :semesters
    add_foreign_key :semester_subjects, :subjects
  end
end
