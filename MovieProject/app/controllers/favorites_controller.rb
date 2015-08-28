class FavoritesController < ApplicationController
  before_action :authenticate_user!

  # GET /favorites
  # GET /favorites.json
  #to show the favorites of someone
  def index
    @favorites = Favorite.where(user_id: current_user.id)
    if @favorites.blank?
      @x = nil ;
    else 
    @x = Array.new(@favorites.length)
    i = 0 ;
      @favorites.each do |f|
        @x[i] = Movie.find(f.movie_id)
        i = i + 1 ;
      end
    end
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
