class AddPriorityToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :priority, :integer, default: 1, null: false, limit: 1
  end
end
