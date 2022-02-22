class ClientBranchesController < ApplicationController
  before_action :set_client_branch, only: %i[ show update destroy ]

  # GET /client_branches
  def index
    @client_branches = ClientBranch.all

    render json: @client_branches
  end

  # GET /client_branches/1
  def show
    render json: @client_branch
  end

  # POST /client_branches
  def create
    @client_branch = ClientBranch.new(client_branch_params)

    if @client_branch.save
      render json: @client_branch, status: :created, location: @client_branch
    else
      render json: @client_branch.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /client_branches/1
  def update
    if @client_branch.update(client_branch_params)
      render json: @client_branch
    else
      render json: @client_branch.errors, status: :unprocessable_entity
    end
  end

  # DELETE /client_branches/1
  def destroy
    @client_branch.update(status: false)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_branch
      @client_branch = ClientBranch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_branch_params
      params.require(:client_branch).permit(:client_id, :client_manager_id, :address, :email, :status, client_branches_manager_attributes: [:name, :last_name, :mother_last_name, client_manager_phones_attributes: [:description, :number]])
    end
end
