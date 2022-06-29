class Task < ApplicationRecord
  belongs_to :user
  has_many :label_tasks, dependent: :destroy
  has_many :labels, through: :label_tasks
  enum status: { waiting: 0, doing: 1, done: 2 }
  enum priority: { low: 0, medium: 1, high: 2 }
  validates :title, presence: true

  scope :sort_tasks, -> (sort) { order(sort[:sort]) }
  scope :sort_list, -> {
    {
      "並び替え" => "",
      "作成の古い順" => "updated_at ASC",
      "作成の新しい順" => "updated_at DESC",
      "優先度の低い順" => "priority ASC",
      "優先度の高い順" => "priority DESC"
    }
  }
end
