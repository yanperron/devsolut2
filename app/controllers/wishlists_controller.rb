class WishlistsController < ApplicationController

skip_before_action :authenticate_user!, only: [:create]
before_action :set_agency, only: [:index ,:new, :edit, :update, :add_wishlist]

def index



  @wishlists = Wishlist.all


end




 def new
     if current_user.nil?
      redirect_to agency_path, alert: "Connectez-vous pour ajouter à votre wishlist"
      else
      @wishlist = Wishlist.new
      @wishlist.user = current_user
      @wishlist.agency = @agency
      if @wishlist.save
        redirect_to agency_wishlists_path(@agency), notice: "L'agence est maintenant dans votre wishlist"
        else
        redirect_to agency_path, alert: "Une erreur est survenu"
      end
    end
  end

  def show
    @wishlist = Wishlist.find(params[:id])
  end

  # POST /reviews
  def create
    @wishlist = @agency.wishlist.new(wishlist_params)
    if @wishlist.save!
      redirect_to @wishlist, notice: 'Wishlist was successfully recorded.'
    else
      render @agency
    end
  end

  def edit
  end


  def update
      @wishlist = @user.wishlist.find(params[:id])
    if @wishlist.save!
      redirect_to @wishlist.user, notice: 'Wishlist was successfully recorded.'
    else
      render @agency
    end
  end

   def add_wishlist
    if current_user.nil?
      redirect_to agency_path, alert: "Connectez-vous pour ajouter à votre wishlist"
      else
      @wishlist = Wishlist.new
      @wishlist.user = current_user
      @wishlist.agency = @agency
      if @wishlist.save
        redirect_to agency_wishlists_path(@agency), notice: "L'agence est maintenant dans votre wishlist"
        else
        redirect_to agency_path, alert: "Une erreur est survenu"
      end
    end
  end




  private

    def set_agency
    @agency = Agency.find(params[:agency_id])
  end

    def wishlist_params
      params.require(:wishlist).permit(:agency_id)
    end
end

