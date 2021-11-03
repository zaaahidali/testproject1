class BusinessesController < ApplicationController
  before_action :set_business, only: %i[ show edit update destroy ]
  before_action :authenticate_user! 
  include Pundit
  # GET /businesses or /businesses.json
  def index
    # @businesses = Business.all
    # user.user_type
    # authorize @businesses
    # @businesses = policy_scope(Business).order(b_name: :desc)
    if current_user.user_type == 'admin'
      # puts current_user
      @businesses = Business.all
    else
      @businesses = current_user.businesses
      # puts "abc"
    end
  end

  # GET /businesses/1 or /businesses/1.json
  def show
  end

  # admin view
  def admin_view
    if params[:business] && params[:business][:id].present?
      # debugger
      @business = Business.find(params[:business][:id])
    else
      @business = Business.first
    end
    @tasks = @business.tasks
  end


  # GET /businesses/new
  def new
    puts "========================================================="
    @business = Business.new
    authorize @business
  end

  # GET /businesses/1/edit
  def edit
    @business = Business.find(params[:id])
    authorize @business
  end
  
  # def edit
  #   @business = Business.find(params[:id])
  #   authorize @business
    
  #   if @business.edit(business_params)
  #     flash[:notice] = "\"#{@business.b_name}\" HEHEHEHEHHEHEHHEHE Editted"
  #     redirect_to @business
  #   else
  #     flash.now[:alert] = "There was an error Editting the Business."
  #     render :edit
  #   end
  # end  



  # POST /businesses or /businesses.json
  def create
    @business = Business.new(business_params)
    authorize @business
    respond_to do |format|
      if @business.save
        format.html { redirect_to @business, notice: "Business was successfully created." }
        format.json { render :show, status: :created, location: @business }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /businesses/1 or /businesses/1.json

  def update
    @business = Business.find(params[:id])
    authorize @business
    
    if @business.update(business_params)
      flash[:notice] = "\"#{@business.b_name}\" HEHEHEHEHHEHEHHEHE Updated."
      redirect_to @business
    else
      flash.now[:alert] = "There was an error Updating the Business."
      render :edit
    end
  end  


  # def update
  #   respond_to do |format|
  #     if @business.update(business_params)
  #       format.html { redirect_to @business, notice: "Business was successfully updated." }
  #       format.json { render :show, status: :ok, location: @business }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @business.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end


    def destroy
      @business = Business.find(params[:id])
      authorize @business
      
      if @business.destroy
        flash[:notice] = "\"#{@business.b_name}\" HEHEHEHEHHEHEHHEHE."
        redirect_to @business
      else
        flash.now[:alert] = "There was an error deleting the Business."
        render :show
      end
    end

  # DELETE /businesses/1 or /businesses/1.json
  # def destroy
  #   @business.destroy
  #   respond_to do |format|
  #     format.html { redirect_to businesses_url, notice: "Business was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business
      @business = Business.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def business_params
      
      params.require(:business).permit(:b_name, :description).merge(user_ids: params[:users][:id].reject(&:empty?))
      
    end



    
end
