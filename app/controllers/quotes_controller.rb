class QuotesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_agency, only: [:new, :create]

  # GET /quotes/new
  def new
    @quote = Quote.new
  end

  # POST /quotes
  def create
    @quote = @agency.quotes.new(quote_params)
    if @quote.save!
      redirect_to @quote.agency, notice: 'Votre devis a été envoyé avec succès'
    else
      render @agency
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_agency
    @agency = Agency.find(params[:agency_id])
  end

  # Only allow a trusted parameter "white list" through.
  def quote_params
    params.require(:quote).permit(:description, :agency_id, :user_id)
  end
end
