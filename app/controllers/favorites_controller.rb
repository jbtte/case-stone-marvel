class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.where(user_id: current_user.id)
  end

  def create
    @favorite = Favorite.new(favorite_params)
    @favorite.user_id = current_user.id

    if @favorite.save!
      flash[:alert] = 'Saved'
    end
  end

  def destroy
    @favorite = Favorite.where(number: params[:id])
    @favorite.destroy

  end

  private

  def favorite_params
    params.permit(:name, :number, :character)
  end
end
