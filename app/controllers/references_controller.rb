class ReferencesController < ApplicationController
  before_action :set_agency, only: [:new, :create]

  def index
    @references = Reference.all
  end


   def new
    @reference = Reference.new
  end

  def show
  end

  # POST /agencies
  def create
    @reference = @agency.references.new(reference_params)
    if @reference.save!
      redirect_to @reference.agency, notice: 'Reference was successfully recorded.'
    else
      render @agency
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_agency
    @agency = Agency.find(params[:agency_id])
  end

  # GET /agencies

def reference_params
  params.require(:reference).permit(:name, :description, :photo, :photo_cache, :agency_id)
end

end
