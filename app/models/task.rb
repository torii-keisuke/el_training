class Task < ApplicationRecord
  belongs_to :user
  enum status: { waiting: 0, doing: 1, done: 2 }
end
