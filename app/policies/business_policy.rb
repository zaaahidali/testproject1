class BusinessPolicy < ApplicationPolicy

  # rails g pundit:policy business   
  # class Scope < Scope
  #   def resolve
  #     if user.user_type == 'admin'
  #       scope.all
  #     else
  #     scope.all

  #       # l = record.user_ids.include?(user.id)
  #       # list = @user.pluck(:name).join(", ")
  #       # scope.where(list: "ali")
  #       # l[] = User.connection.exec_query(" SELECT users.name FROM users INNER JOIN businesses_users ON businesses_users.user_id = users.
  #       #   id WHERE users.user_type = $1 ")
  #       # scope.where(l: true)





  #       # users = User.all
  #       # scope.where(b_name: "Business 1")
  #       # scope.all
  #       # list = @business.users.pluck(:name).join(", ")
  #       # scope.where(b_name: "Business 1")
  #       # <p>  <strong>Team Members:</strong><%= @business.users.pluck(:name).join(", ")  %></p>
  #       # l = User.connection.exec_query(SELECT "users"."name" FROM "users" INNER JOIN "businesses_users" ON "businesses_users"."user_id" = "users"."id" WHERE "users"."user_type" = 10) 


  #       #  l = User.connection.exec_query(' SELECT users.name FROM users INNER JOIN businesses_users ON businesses_users.user_id = users.
  #       #   id WHERE users.user_type = 10  ')  
  #       # scope.where(l: "ali")
  #       # scope.all  

  #       # @businesses = Business.all
  #       # @businesses.each do |business|
  #       #   business.users.pluck(:name).join(",")
  #       # end 
  #       # scope.where(name: "admin")
      





  #       # User.joins(:businesses_user)

  #       # SELECT "users" FROM "users" INNER JOIN "businesses_users" ON "businesses_users"."user_id" = "users"."id" WHERE "users"."user_type" = "admin" 
  #       # User.connection.exec_query('SELECT "users" FROM "users" INNER JOIN "businesses_users" ON "businesses_users"."user_id" = "users"."id" WHERE "users"."user_type" = "admin" ')
  #       # SELECT "users"."name" FROM "users" INNER JOIN "businesses_users" ON "businesses_users"."user_id" = "users"."id" WHERE "users"."user_type" = $1 
       
  #     end
  #   end
  # end

  # def index?
  #   @user.user_has_role? :admin
  # end
  def create?
    user.user_type == 'admin' 
  end

  def new?
    create?
  end

  def destroy?    
        # user.user_type == 'writing_broker' || record.user == user
      # @user.user_has_role? :'writing_broker'
      user.user_type == 'writing_broker' || user.user_type == 'admin'
  end

  def edit?
    update?
  end

  def update?
    !user.support? && record.user_ids.include?(user.id)

  end

  # def update?
  #     user.writing_broker? or not record.published?
  #   end
  
  # def edit?
  #     user.user_type == 'writing_broker'
  # end

end











