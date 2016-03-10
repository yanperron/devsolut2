class AgenciesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:compare, :index, :show, :search]

  before_action :set_agency, only: [:show, :edit, :update, :destroy]

  # GET /agencies
  def index
    @agencies = Agency.all
  end

  def search
    @agencies = Agency.where(description: params[:what])
  end

  # GET /agencies/1
  def show
    @agency = Agency.find(params[:id])
    @github_report = @agency.github_reports.last
    @linkedin_report = @agency.linkedin_reports.last
  end

  # GET /agencies/new
  def new
    @agency = Agency.new
  end

  # GET /agencies/1/edit
  def edit
  end

  # POST /agencies
  def create
    @agency = Agency.new(agency_params)


    if @agency.save
      redirect_to @agency, notice: 'Agency was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /agencies/1
  def update
        @agency = Agency.find(params[:id])

    if @agency.update(agency_params)
      redirect_to @agency, notice: 'Agency was successfully updated.'
    else
      render :edit
    end
  end

  def compare
    ids = params[:ids].split(',')
    @agencies = []
    ids.each do |id|
      @agencies << Agency.find(id)
    end
  end

  # DELETE /agencies/1
  def destroy
    @agency.destroy
    redirect_to agencies_url, notice: 'Agency was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agency
      @agency = Agency.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def agency_params
      params.require(:agency).permit(:name, :description, :address, :user_id, :where, :photo, :photo_cache, :linkedin_account, :github_account)
    end

end
