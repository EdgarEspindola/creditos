class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_profile

  # GET /profiles/1
  # GET /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
    @profile.first_name = current_user.name
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user

    respond_to do |format|
      if @profile.save
        flash[:success] = I18n.t('profiles.created')
        format.html { redirect_to requisitions_url }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    @profile.user = current_user
    
    respond_to do |format|      
      if @profile.update(profile_params)
        flash[:success] = I18n.t('profiles.updated')
        format.html { redirect_to @profile }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:first_name, :second_name, :second_last_name, :first_last_name, :birth_date, :curp, :rfc, :gender, :birth_state, :phone_number)
    end

    def invalid_profile
      logger.error "Attempt to access invalid profile #{params[:id]}"
      flash[:warning] = I18n.t('.profiles.invalid')
      redirect_to root_path
    end
end
