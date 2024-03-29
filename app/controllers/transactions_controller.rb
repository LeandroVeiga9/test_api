class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_transaction, only: %i[ show update destroy ]

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.page(params[:page].presence || 1).per(10)
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.user = current_user

    begin
      if transaction_params.values.include?(nil) || transaction_params.values.include?('')
        index = transaction_params.values.find_index(nil) || transaction_params.values.find_index('')
        raise "#{transaction_params.keys[index]} não pode ser vazio"
      elsif @transaction.card_number.digits.length != 16
        raise "Numero do cartão invalido"
      elsif @transaction.cvv.digits.length > 4 || @transaction.cvv.digits.length < 3
        raise "cvv invalido"
      elsif @transaction.value_in_cents < 1
        raise "valor da transição não pode ser 0"
      end
      @transaction.save!
      render :show, status: :created, location: @transaction
    rescue => e
      render json: {error_message: e}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    if @transaction.update(transaction_params)
      render :show, status: :ok, location: @transaction
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.where(id: params[:id]).first
      if @transaction.nil?
        render json: "transaction with id #{params[:id]} not found", status: :not_found
        return
      end
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:transaction).permit(:card_number, :value_in_cents, :card_expiration_date, :cvv)
    end
end
