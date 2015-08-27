class CreateSemesters < ActiveRecord::Migration
  def change
    create_table :semesters do |t|
      t.references :group, index: true
      t.integer :number

      t.timestamps null: false
    end
    add_foreign_key :semesters, :groups
  end
end
