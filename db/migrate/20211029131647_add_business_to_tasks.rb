class AddBusinessToTasks < ActiveRecord::Migration[6.1]
  def change
    add_reference :tasks, :business, null: false, foreign_key: true
  end
end
