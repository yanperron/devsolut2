class AgenciesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:compare, :index, :show, :add_wishlist]

  before_action :set_agency, only: [:show, :edit, :update, :destroy,:add_wishlist]

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

  def show_more

        @agency = Agency.find(params[:id])
         @agencies = Agency.where(agency_id: @agency.id)
  end


  def add_wishlist
    if current_user.nil?
      redirect_to agency_path, alert: "Connectez-vous pour ajouter à votre wishlist"
    else
      wish = Wishlist.new
      wish.user = current_user
      wish.agency = @agency
      if wish.save
        redirect_to agency_path, notice: "L'agence est maintenant dans votre wishlist"
      else
        redirect_to agency_path, alert: "Une erreur est survenu"
      end
    end
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

    session['search_params'] = params

    @agencies = params[:agencies] || []

    if
      @agencies.length == 0
      all_agencies = Agency.all
      @agencies_name = ["-"]
    else
         agencies = @agencies.reject{|k,v| v == '0'}.keys
      @agencies_name = agencies.map { |k,v| Agency.find(k).name }
      all_agencies = Agency.includes(:agency).where(agency: agencies)
    end

  end





      #     end
       #  end








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

