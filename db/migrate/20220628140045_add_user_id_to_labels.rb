class AddUserIdToLabels < ActiveRecord::Migration[7.0]
  def change
    add_column :labels, :user_id, :integer
  end
end
