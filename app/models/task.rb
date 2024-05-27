class Task < ApplicationRecord
  validates :title, presence: true
  validates :completed, inclusion: { in: [true, false] }
  validates :due_date, date: true, allow_nil: true
end
