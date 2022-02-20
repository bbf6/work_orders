class ClientManagerPhonesController < ApplicationController
  before_action :set_client_manager_phone, only: %i[ show update destroy ]

  # GET /client_manager_phones
  def index
    @client_manager_phones = ClientManagerPhone.all

    render json: @client_manager_phones
  end

  # GET /client_manager_phones/1
  def show
    render json: @client_manager_phone
  end

  # POST /client_manager_phones
  def create
    @client_manager_phone = ClientManagerPhone.new(client_manager_phone_params)

    if @client_manager_phone.save
      render json: @client_manager_phone, status: :created, location: @client_manager_phone
    else
      render json: @client_manager_phone.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /client_manager_phones/1
  def update
    if @client_manager_phone.update(client_manager_phone_params)
      render json: @client_manager_phone
    else
      render json: @client_manager_phone.errors, status: :unprocessable_entity
    end
  end

  # DELETE /client_manager_phones/1
  def destroy
    @client_manager_phone.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_manager_phone
      @client_manager_phone = ClientManagerPhone.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_manager_phone_params
      params.require(:client_manager_phone).permit(:client_manager_id, :description, :number, :status)
    end
end
