class ClientManagersController < ApplicationController
  before_action :set_client_manager, only: %i[ show update destroy ]

  # GET /client_managers
  def index
    @client_managers = ClientManager.all

    render json: @client_managers
  end

  # GET /client_managers/1
  def show
    render json: @client_manager
  end

  # POST /client_managers
  def create
    @client_manager = ClientManager.new(client_manager_params)

    if @client_manager.save
      render json: @client_manager, status: :created, location: @client_manager
    else
      render json: @client_manager.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /client_managers/1
  def update
    if @client_manager.update(client_manager_params)
      render json: @client_manager
    else
      render json: @client_manager.errors, status: :unprocessable_entity
    end
  end

  # DELETE /client_managers/1
  def destroy
    @client_manager.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_manager
      @client_manager = ClientManager.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_manager_params
      params.require(:client_manager).permit(:name, :last_name, :mother_last_name, :status)
    end
end
