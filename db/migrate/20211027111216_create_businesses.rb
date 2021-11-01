class CreateBusinesses < ActiveRecord::Migration[6.1]
  def change
    create_table :businesses do |t|
      t.string :b_name, null: false
      t.text :description 

      t.timestamps
    end
  end
end
