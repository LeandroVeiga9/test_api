class IuasController < ApplicationController
  before_action :set_iua, only: [:show, :update, :destroy]

  # GET /iuas
  def index
    @iuas = Iua.all

    render json: @iuas
  end

  # GET /iuas/1
  def show
    render json: @iua
  end

  # POST /iuas
  def create
    @iua = Iua.new(iua_params)

    if @iua.save
      render json: @iua, status: :created, location: @iua
    else
      render json: @iua.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /iuas/1
  def update
    if @iua.update(iua_params)
      render json: @iua
    else
      render json: @iua.errors, status: :unprocessable_entity
    end
  end

  # DELETE /iuas/1
  def destroy
    @iua.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_iua
      @iua = Iua.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def iua_params
      params.require(:iua).permit(:name)
    end
end
