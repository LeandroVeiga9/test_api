class IusController < ApplicationController
  before_action :set_iu, only: [:show, :update, :destroy]

  # GET /ius
  def index
    @ius = Iu.all

    render json: @ius
  end

  # GET /ius/1
  def show
    render json: @iu
  end

  # POST /ius
  def create
    @iu = Iu.new(iu_params)

    if @iu.save
      render json: @iu, status: :created, location: @iu
    else
      render json: @iu.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ius/1
  def update
    if @iu.update(iu_params)
      render json: @iu
    else
      render json: @iu.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ius/1
  def destroy
    @iu.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_iu
      @iu = Iu.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def iu_params
      params.require(:iu).permit(:name)
    end
end
