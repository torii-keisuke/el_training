class CreateLabelTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :label_tasks do |t|
      t.integer :task_id, null: false
      t.integer :label_id, null: false

      t.timestamps
    end
  end
end
