class AddUserIdToLabels < ActiveRecord::Migration[7.0]
  def change
    add_reference :labels, :user, foreign_key: true
  end
end
