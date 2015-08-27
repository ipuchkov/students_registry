class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.references :group, index: true
      t.string :name
      t.string :surname

      t.timestamps null: false
    end
    add_foreign_key :students, :groups
  end
end
