class RetainersController < ApplicationController
  before_action :set_retainer, only: %i[ show update destroy ]

  # GET /retainers
  def index
    @retainers = Retainer.all

    render json: @retainers
  end

  # GET /retainers/1
  def show
    render json: @retainer
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
    @retainer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_retainer
      @retainer = Retainer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def retainer_params
      params.require(:retainer).permit(:service_date, :work_order_id, :status)
    end
end
