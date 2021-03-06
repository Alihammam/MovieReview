class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy ,:addToFavorite]
  before_action :set_rates , :rating_average , only: [:show]
  before_action :authenticate_user! ,except: [:index ]
  before_action :set_actors , only: [:show]
  before_action :set_favorite ,only: [:show]

  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.all
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    #find all comments
    @comments = Comment.where(movie_id:  @movie.id)
  end

  # GET /movies/new
  def new
    @movie = current_user.movies.build
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = current_user.movies.build(movie_params)
    respond_to do |format|
      if @movie.save 
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def addToFavorite
    @f = Favorite.new
    @f.user_id = current_user.id
    @f.movie_id = @movie.id
    respond_to do |format|
    if @f.save 
        format.html { redirect_to @movie, notice: 'Added to favorites' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def removeFromFavorite (f)
      f.destroy
      respond_to do |format|
        format.html { redirect_to @movie, notice: 'Favorite was successfully destroyed.' }
        format.json { head :no_content }
      end
  end

  def destroyFavorite
    set_favorite
    removeFromFavorite
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    def set_rates
      @rates = Rating.where(movie_id: @movie.id)
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:title, :description, :length, :director_id,:image,:rating)
    end
    
    def rating_average 
      i = 0 ;
      if @rates.blank?
        @finalrate = 0 
      else
        @finalrate = @rates.average(:rate).round(2) 
      end
    end

    def set_actors 
      @actorsID = Acmo.where(movie_id: @movie.id)
      i = 0 ;
      @x = Array.new(@actorsID.length)
        if !@actorsID.blank?
          @actorsID.each do |f| 
           @x[i] = Actor.find(@actorsID[i].actor_id)
            i = i+1
          end
        end
    end

    def set_favorite
      @f = Favorite.where(:movie_id=>@movie.id,:user_id=>current_user.id)
    end 
end
