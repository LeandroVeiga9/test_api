class AwesController < ApplicationController
  before_action :set_awe, only: %i[ show update destroy ]

  # GET /awes
  # GET /awes.json
  def index
    @awes = Awe.all
  end

  # GET /awes/1
  # GET /awes/1.json
  def show
  end

  # POST /awes
  # POST /awes.json
  def create
    @awe = Awe.new(awe_params)

    if @awe.save
      render :show, status: :created, location: @awe
    else
      render json: @awe.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /awes/1
  # PATCH/PUT /awes/1.json
  def update
    if @awe.update(awe_params)
      render :show, status: :ok, location: @awe
    else
      render json: @awe.errors, status: :unprocessable_entity
    end
  end

  # DELETE /awes/1
  # DELETE /awes/1.json
  def destroy
    @awe.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_awe
      @awe = Awe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def awe_params
      params.require(:awe).permit(:name)
    end
end
