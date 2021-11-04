class Task < ApplicationRecord
    enum task_type: {
        feature: 0,
        bug: 1
      }       
  belongs_to :business
  validates :title, presence: true, uniqueness: true

end
  