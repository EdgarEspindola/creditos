class RequisitionsController < ApplicationController
  before_action :check_profile_exist
  before_action :set_requisition, only: [:show, :edit, :update]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_requisition

  # GET /requisitions
  # GET /requisitions.json
  def index
    @requisitions = current_user.requisitions.order('updated_at DESC')
  end

  # GET /requisitions/1
  # GET /requisitions/1.json
  def show
  end

  # GET /requisitions/new
  def new
    @requisition = Requisition.new
    @requisition.personal_references.build
  end

  # GET /requisitions/1/edit
  def edit
  end

  # POST /requisitions
  # POST /requisitions.json
  def create
    @requisition = Requisition.new(requisition_params)
    @requisition.profile = current_user.profile

    respond_to do |format|
      if @requisition.save
        flash[:success] = I18n.t('.requisitions.created')
        format.html { redirect_to @requisition }
        format.json { render :show, status: :created, location: @requisition }
      else
        format.html { render :new }
        format.json { render json: @requisition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requisitions/1
  # PATCH/PUT /requisitions/1.json
  def update    
    respond_to do |format|
      if @requisition.update(requisition_params)
        flash[:success] = I18n.t('.requisitions.updated')
        format.html { redirect_to @requisition }
        format.json { render :show, status: :ok, location: @requisition }
      else
        format.html { render :edit }
        format.json { render json: @requisition.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_requisition
      @requisition = Requisition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def requisition_params
      params.require(:requisition).permit(:income, :address_years, :company_years, :marital_status, 
        :requested_amount, :payment_terms, :bank, :comment, :company_name, :company_phone_number, 
        :dependents_number, :company_position, :has_sgmm, :has_imss, :has_car,
        personal_references_attributes: [
          :id, :first_name, :second_name, :first_last_name, :second_last_name, :cell_phone_number
        ])      
    end
    
    def check_profile_exist
      if current_user.profile.blank?
        flash[:warning] = I18n.t('profiles.blank')
        redirect_to new_profile_path
      end
    end

    def invalid_profile
      logger.error "Attempt to access invalid requisition #{params[:id]}"
      flash[:warning] = I18n.t('.requisitions.invalid')
      redirect_to root_path
    end
end
