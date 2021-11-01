# class TasksController < ApplicationController
#     def index
#     end

#     def new
#         @task = Task.new 
#         @tasks = Task.find(:all)       
#     end

#     def create
#         @task = Task.new(params[:task])
#         if @task.save
#             redirect_to new_task_path
#         end
#     end        
#     # validates: profile_picture, content_type: [:png, :jpg, :jpeg]
#     # validates :name, presence: true
# end


class TasksController < ApplicationController


  # before_action :configure_permitted_parameters, if: :devise_controller?
  # protected

  # def configure_permitted_parameters
  #     devise_parameter_sanitizer.permit(:sign_up, keys: [:title, :task_type])
  # end

  def new
    @task = Task.new
    @tasks = Task.all
  end

  def create
    @task = Task.new(task_params)
    respond_to do |format|
      # byebug
        if @task.save
          format.html { redirect_to new_task_path, notice: "Task was successfully created." }
          format.json { render :show, status: :created, location: @task }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @task.errors, status: :unprocessable_entity }
        end
      end
    end

    def task_params
      params.require(:task).permit(:title, :due_date, :task_type, :image, :business_id)
      # params.require(:business).permit(:b_name, :description).merge(user_ids: params[:users][:id].reject(&:empty?))
    end
  end  
