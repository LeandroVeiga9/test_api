class IuysController < ApplicationController
  before_action :set_iuy, only: [:show, :update, :destroy]

  # GET /iuys
  def index
    @iuys = Iuy.all

    render json: @iuys
  end

  # GET /iuys/1
  def show
    render json: @iuy
  end

  # POST /iuys
  def create
    @iuy = Iuy.new(iuy_params)

    if @iuy.save
      render json: @iuy, status: :created, location: @iuy
    else
      render json: @iuy.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /iuys/1
  def update
    if @iuy.update(iuy_params)
      render json: @iuy
    else
      render json: @iuy.errors, status: :unprocessable_entity
    end
  end

  # DELETE /iuys/1
  def destroy
    @iuy.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_iuy
      @iuy = Iuy.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def iuy_params
      params.require(:iuy).permit(:name)
    end
end
