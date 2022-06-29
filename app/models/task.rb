class Task < ApplicationRecord
  belongs_to :user
  has_many :label_tasks, dependent: :destroy
  has_many :labels, through: :label_tasks
  enum status: { waiting: 0, doing: 1, done: 2 }
  enum priority: { low: 0, medium: 1, high: 2 }
  validates :title, presence: true
end
