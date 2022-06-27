class AddStatusToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :status, :integer, default: 0, null: false, limit: 1
  end
end
