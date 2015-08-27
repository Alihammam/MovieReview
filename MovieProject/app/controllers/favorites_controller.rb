class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:show, :edit, :update, :destroy]
  before_action :set_movie
  before_action :authenticate_user!
  # GET /favorites
  # GET /favorites.json
  def index
    @favorites = Favorite.all

  end

  # GET /favorites/1
  # GET /favorites/1.json
  def show
    @favorites = Favoirte.where(user_id: current_user.id)
  end

  # GET /favorites/new
  def new
    @favorite = Favorite.current_user.favorites.build
  end

  # GET /favorites/1/edit
  def edit
  end

  # POST /favorites
  # POST /favorites.json
  def create
    @favorite = Favorite.current_user.favorites.build(favorite_params)
    @favorite.user_id = current_user.id 
    @favorite.user_id = @movie.id
    respond_to do |format|
      if @favorite.save
        format.html { redirect_to @favorite, notice: 'Favorite was successfully created.' }
        format.json { render :show, status: :created, location: @favorite }
      else
        format.html { render :new }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favorites/1
  # PATCH/PUT /favorites/1.json
  def update
    respond_to do |format|
      if @favorite.update(favorite_params)
        format.html { redirect_to @favorite, notice: 'Favorite was successfully updated.' }
        format.json { render :show, status: :ok, location: @favorite }
      else
        format.html { render :edit }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorites/1
  # DELETE /favorites/1.json
  def destroy
    @favorite.destroy
    respond_to do |format|
      format.html { redirect_to favorites_url, notice: 'Favorite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite
      @favorite = Favorite.find(params[:id])
    end

    def set_movie
      @movie = Movie.find(params[:movie_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def favorite_params
      params.require(:favorite).permit(:user_id, :movie_id)
    end
end
