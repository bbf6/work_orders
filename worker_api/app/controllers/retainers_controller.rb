class RetainersController < ApplicationController
  before_action :set_retainer, only: %i[ update destroy ]

  # GET /retainers
  def index
    @retainers = Retainer.includes(client_branch: :client_manager)
    render json: @retainers, include: :client_branch
  end

  # GET /retainers/1
  def show
    @retainer = Retainer.includes(client_branch: :client_manager).where(id: params[:id]).first
    render json: @retainer, include: :client_branch
  end

  # POST /retainers
  def create
    @retainer = Retainer.new(retainer_params)
    if @retainer.save
      render json: @retainer, status: :created, location: @retainer
    else
      render json: @retainer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /retainers/1
  def update
    if @retainer.update(retainer_params)
      render json: @retainer
    else
      render json: @retainer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /retainers/1
  def destroy
    @retainer.update(status: false)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_retainer
      @retainer = Retainer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def retainer_params
      params.require(:retainer).permit(:id, :service_date, :client_branch_id)
    end
end
