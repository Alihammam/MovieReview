class AcmosController < ApplicationController
  before_action :set_acmo, only: [:show, :edit, :update, :destroy]

  # GET /acmos
  # GET /acmos.json
  def index
    @acmos = Acmo.all
  end

  # GET /acmos/1
  # GET /acmos/1.json
  def show
  end

  # GET /acmos/new
  def new
    @acmo = Acmo.new
  end

  # GET /acmos/1/edit
  def edit
  end

  # POST /acmos
  # POST /acmos.json
  def create
    @acmo = Acmo.new(acmo_params)

    respond_to do |format|
      if @acmo.save
        format.html { redirect_to @acmo, notice: 'Acmo was successfully created.' }
        format.json { render :show, status: :created, location: @acmo }
      else
        format.html { render :new }
        format.json { render json: @acmo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /acmos/1
  # PATCH/PUT /acmos/1.json
  def update
    respond_to do |format|
      if @acmo.update(acmo_params)
        format.html { redirect_to @acmo, notice: 'Acmo was successfully updated.' }
        format.json { render :show, status: :ok, location: @acmo }
      else
        format.html { render :edit }
        format.json { render json: @acmo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /acmos/1
  # DELETE /acmos/1.json
  def destroy
    @acmo.destroy
    respond_to do |format|
      format.html { redirect_to acmos_url, notice: 'Acmo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_acmo
      @acmo = Acmo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def acmo_params
      params.require(:acmo).permit(:actor_id, :movie_id)
    end
end
