class AsdsController < ApplicationController
  before_action :set_asd, only: [:show, :update, :destroy]

  # GET /asds
  def index
    @asds = Asd.all

    render json: @asds
  end

  # GET /asds/1
  def show
    render json: @asd
  end

  # POST /asds
  def create
    @asd = Asd.new(asd_params)

    if @asd.save
      render json: @asd, status: :created, location: @asd
    else
      render json: @asd.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /asds/1
  def update
    if @asd.update(asd_params)
      render json: @asd
    else
      render json: @asd.errors, status: :unprocessable_entity
    end
  end

  # DELETE /asds/1
  def destroy
    @asd.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asd
      @asd = Asd.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def asd_params
      params.require(:asd).permit(:name)
    end
end
