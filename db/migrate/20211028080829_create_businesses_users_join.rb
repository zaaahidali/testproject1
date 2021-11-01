class CreateBusinessesUsersJoin < ActiveRecord::Migration[6.1]
  def change
    create_table :businesses_users, :id => false do |t|
      t.integer "business_id"
      t.integer "user_id"
      t.timestamps
    end
    add_index("businesses_users", ["business_id", "user_id"])
    #Ex:- add_index("admin_users", "username")
  end
end
