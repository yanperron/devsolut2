class ReviewsController < ApplicationController
  before_action :set_agency, only: [:new, :create]

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # POST /reviews
  def create
    @review = @agency.reviews.new(review_params)
    if @review.save!
      redirect_to @review.agency, notice: 'Review was successfully recorded.'
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
  def review_params
    params.require(:review).permit(:description, :agency_id, :user_id, :star)
  end
end
