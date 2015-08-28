class AddIndexesToAverageMark < ActiveRecord::Migration
  def up
    execute "CREATE INDEX index_average_marks_on_number ON average_marks (value);"
  end

  def down
    execute "DROP INDEX index_average_marks_on_value;"
  end
end
