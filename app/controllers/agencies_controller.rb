class AgenciesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:compare, :index, :show]

  before_action :set_agency, only: [:show, :edit, :update, :destroy]

  # GET /agencies
  def index

    search_params = session['search_params']
@agencies_selected = []

unless search_params.nil?
  @agencies_selected = search_params['agencies'].reject{|k,v| v == "0"}.keys if search_params['agencies']
end
   @agencies = Agency.all






  end

  def search



    @agencies = Agency.where("description = ?", params[:what])


  end



  # GET /agencies/1
  def show
    @agency = Agency.find(params[:id])
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

    redirect_to @agencies_selected

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
      params.require(:agency).permit(:name, :description, :address, :user_id, :where, :photo, :photo_cache)
    end

end
