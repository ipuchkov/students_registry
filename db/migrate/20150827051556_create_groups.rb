class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.references :course, index: true
      t.string :number

      t.timestamps null: false
    end
    add_foreign_key :groups, :courses
  end
end
