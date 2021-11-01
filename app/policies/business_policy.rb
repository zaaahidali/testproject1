class BusinessPolicy < ApplicationPolicy

  # rails g pundit:policy business   
  class Scope < Scope
    def resolve
      scope.all
    end
  end

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
    user.user_type == 'writing_broker' || user.user_type == 'admin'
  end

  # def update?
  #     user.writing_broker? or not record.published?
  #   end
  
  # def edit?
  #     user.user_type == 'writing_broker'
  # end

end
