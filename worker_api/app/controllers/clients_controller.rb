class ClientsController < ApplicationController
  before_action :set_client, only: %i[ update destroy ]

  # GET /clients
  def index
    @clients = Client.with_branches
    render json: @clients, include: branches_format
  end

  # GET /clients/1
  def show
    @client = Client.with_branches.where(id: params[:id])
    render json: @client, include: branches_format
  end

  # POST /clients
  def create
    @client = Client.new(client_params)
    if @client.save
      render json: @client, status: :created, location: @client
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /clients/1
  def update
    if @client.update(client_params)
      render json: @client
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  # DELETE /clients/1
  def destroy
    @client.update(status: false)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_params
      params.require(:client).permit(:name, :status, client_branches_attributes: [:address, :email, client_manager_attributes: [:name, :last_name, :mother_last_name, client_manager_phones_attributes: [:description, :number]]])
    end

    def branches_format
      [{ client_branches: { only: [:id, :client_id, :address, :email], include: { client_manager: { only: [:id, :client_branch_id, :name, :last_name, :mother_last_name], include: [{ client_manager_phones: { only: [:id, :client_manager_id, :description, :number] } }] } } } }]
    end
end
