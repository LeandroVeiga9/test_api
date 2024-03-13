class DsasController < ApplicationController
  before_action :set_dsa, only: [:show, :update, :destroy]

  # GET /dsas
  def index
    @dsas = Dsa.all

    render json: @dsas
  end

  # GET /dsas/1
  def show
    render json: @dsa
  end

  # POST /dsas
  def create
    @dsa = Dsa.new(dsa_params)

    if @dsa.save
      render json: @dsa, status: :created, location: @dsa
    else
      render json: @dsa.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dsas/1
  def update
    if @dsa.update(dsa_params)
      render json: @dsa
    else
      render json: @dsa.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dsas/1
  def destroy
    @dsa.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dsa
      @dsa = Dsa.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dsa_params
      params.require(:dsa).permit(:name)
    end
end
