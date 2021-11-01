class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?


    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
    private
  
    def user_not_authorized
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(request.referrer || root_path)
    end


    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :user_type])
    end

    def after_sign_in_path_for(resource)
        businesses_path
    end

    # def index
    #     @users = User.order(created_at: :desc)
    #     authorize @users
    # end

    
end
