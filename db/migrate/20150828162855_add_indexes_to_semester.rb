class AddIndexesToSemester < ActiveRecord::Migration
  def up
    execute "CREATE INDEX index_semesters_on_number ON semesters (number);"
  end

  def down
    execute "DROP INDEX index_semesters_on_number;"
  end
end
