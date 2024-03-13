class QwesController < ApplicationController
  before_action :set_qwe, only: [:show, :update, :destroy]

  # GET /qwes
  def index
    @qwes = Qwe.all

    render json: @qwes
  end

  # GET /qwes/1
  def show
    render json: @qwe
  end

  # POST /qwes
  def create
    @qwe = Qwe.new(qwe_params)

    if @qwe.save
      render json: @qwe, status: :created, location: @qwe
    else
      render json: @qwe.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /qwes/1
  def update
    if @qwe.update(qwe_params)
      render json: @qwe
    else
      render json: @qwe.errors, status: :unprocessable_entity
    end
  end

  # DELETE /qwes/1
  def destroy
    @qwe.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qwe
      @qwe = Qwe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def qwe_params
      params.require(:qwe).permit(:name)
    end
end
