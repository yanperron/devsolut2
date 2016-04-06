class AgenciesController < ApplicationController

<<<<<<< HEAD
  skip_before_action :authenticate_user!, only: [:compare, :index, :show, :add_wishlist]

  before_action :set_agency, only: [:show, :edit, :update, :destroy, :add_wishlist]



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

    condition = case params[:what]
    when "web" then { does_web_development: true }
    when "mobile" then { does_mobile_development: true }
    else {}
    end
    @agencies = Agency.where(condition)
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
      AgencyMailer.create(@agency).deliver_now
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
      params.require(:agency).permit(:name, :description, :address, :user_id, :where, :photo, :photo_cache, :linkedin_account, :github_account)
    end

end

