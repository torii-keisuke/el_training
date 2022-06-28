class AddStartDateToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :start_date, :datetime
    add_column :tasks, :end_date, :datetime
  end
end
