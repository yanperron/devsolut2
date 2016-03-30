class WishlistsController < ApplicationController

skip_before_action :authenticate_user!, only: [:create]
before_action :set_user, only: [:index, :edit, :update]

  def index
    @wishlists = Wishlist.all
  end

  def new
    @wishlist = Wishlist.new
  end

  def show
    @wishlist = Wishlist.find(params[:id])
  end

  # POST /reviews
  def create
    @wishlist = @user.wishlist.new(wishlist_params)
    if @wishlist.save!
      redirect_to @wishlist.user, notice: 'Review was successfully recorded.'
    else
      render @agency
    end
  end

  def edit
  end


  def update
      @wishlist = @user.wishlist.find(params[:id])
    if @wishlist.save!
      redirect_to @wishlist.user, notice: 'Review was successfully recorded.'
    else
      render @agency
    end
  end




  private

  def set_user
    @user = User.find(current_user.id)
  end

  def wishlist_params
    params.require(:wishlist).permit(:agency_id)
  end

end

