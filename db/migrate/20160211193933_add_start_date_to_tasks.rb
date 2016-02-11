class AddStartDateToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :start_date, :datetime, default: nil
    add_index :tasks, :start_date
  end
end
