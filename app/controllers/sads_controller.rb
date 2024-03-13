class SadsController < ApplicationController
  before_action :set_sad, only: [:show, :update, :destroy]

  # GET /sads
  def index
    @sads = Sad.all

    render json: @sads
  end

  # GET /sads/1
  def show
    render json: @sad
  end

  # POST /sads
  def create
    @sad = Sad.new(sad_params)

    if @sad.save
      render json: @sad, status: :created, location: @sad
    else
      render json: @sad.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sads/1
  def update
    if @sad.update(sad_params)
      render json: @sad
    else
      render json: @sad.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sads/1
  def destroy
    @sad.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sad
      @sad = Sad.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sad_params
      params.require(:sad).permit(:name)
    end
end
