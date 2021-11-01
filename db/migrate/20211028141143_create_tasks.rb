class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title, unique: true, null: false
      #Ex:- :null => false
      t.date :due_date

      t.timestamps
    end
  end
end
