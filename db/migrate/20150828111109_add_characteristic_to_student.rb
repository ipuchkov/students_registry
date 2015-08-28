class AddCharacteristicToStudent < ActiveRecord::Migration
  def change
    add_column :students, :characteristic, :text
  end
end
