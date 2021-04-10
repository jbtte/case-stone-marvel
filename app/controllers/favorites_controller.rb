class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.where(user_id: current_user.id)
  end

  def create
    @favorite = Favorite.new(favorite_params)
    @favorite.user_id = current_user.id

    unless @favorite.save!
      flash[:alert] = 'Not Saved'
    end
  end

  def destroy
    @favorite = Favorite.where(number: params["id"])
    @favorite[0].destroy!

  end

  private

  def favorite_params
    params.permit(:name, :number, :character, :url)
  end
end
