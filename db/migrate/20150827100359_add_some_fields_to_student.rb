class AddSomeFieldsToStudent < ActiveRecord::Migration
  def change
    add_column :students, :birthdate, :date
    add_column :students, :ip, :string
    add_column :students, :registration_time, :datetime
  end
end
