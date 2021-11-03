class Task < ApplicationRecord
    enum task_type: {
        feature: 0,
        bug: 1
      }       
  belongs_to :business
  
end
  