class AddTaskTypeToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :task_type, :integer
  end
end
