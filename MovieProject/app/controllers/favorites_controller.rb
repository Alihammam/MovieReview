class FavoritesController < ApplicationController
  before_action :authenticate_user!
  # GET /favorites
  # GET /favorites.json
  #to show the favorites of someone
  def index
    @favorites = Favorite.all

  end

    def destroy
      @f.destroy
      respond_to do |format|
        format.html { redirect_to @movie, notice: 'Favorite was successfully destroyed.' }
        format.json { head :no_content }
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite
      @favorite = Favorite.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def favorite_params
      params.require(:favorite).permit(:user_id, :movie_id)
    end
end
