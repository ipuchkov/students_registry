class AddIndexesToStudent < ActiveRecord::Migration
  def up
    execute "CREATE INDEX index_students_on_lowercase_name ON students (lower(name));"
    execute "CREATE INDEX index_students_on_lowercase_surname ON students (lower(surname));"
    execute "CREATE INDEX index_students_on_ip ON students (ip);"
  end

  def down
    execute "DROP INDEX index_students_on_lowercase_name;"
    execute "DROP INDEX index_students_on_lowercase_surname;"
    execute "DROP INDEX index_students_on_ip;"
  end
end
