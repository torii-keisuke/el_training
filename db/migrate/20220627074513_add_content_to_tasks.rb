class AddContentToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :content, :text
  end
end
