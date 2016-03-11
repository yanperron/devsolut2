class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:home]
  def home
    @agencies = Agency.where(id: Review.group(:agency_id).count.keys).limit(3)
    @reviews = Review.where.not(user_id: nil).limit(3)
  end
end
