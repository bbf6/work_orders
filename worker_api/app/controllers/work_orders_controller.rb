class WorkOrdersController < ApplicationController
  before_action :set_work_order, only: %i[ show update destroy work_done ]
  before_action :thecnician_params, only: [:by_thecnician]

  # GET /work_orders
  def index
    @work_orders = WorkOrder.all

    render json: @work_orders
  end

  def by_thecnician
    @work_orders = WorkOrder.by_thecnician params[:thecnician_id]
    render json: @work_orders, include: [ticket_format, retainer_format]
  end

  def work_done
    @work_order.status = 'done'
    @work_order.ending_attention_date = DateTime.now
    if @work_order.save
      render json: @work_order
    else
      render json: @work_order.errors, status: :unprocessable_entity
    end
  end

  def pending
    @work_orders = WorkOrder.pending_works
    render json: @work_orders, include: [ticket_format, retainer_format]
  end

  def done
    @work_orders = WorkOrder.done_works
    render json: @work_orders, include: [ticket_format, retainer_format]
  end

  # GET /work_orders/1
  def show
    render json: @work_order
  end

  # POST /work_orders
  def create
    @work_order = WorkOrder.new(work_order_params)

    if @work_order.save
      render json: @work_order, status: :created, location: @work_order
    else
      render json: @work_order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /work_orders/1
  def update
    if @work_order.update(work_order_params)
      render json: @work_order
    else
      render json: @work_order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /work_orders/1
  def destroy
    @work_order.status = 'canceled'
    @work_order.save
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_order
      @work_order = WorkOrder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def work_order_params
      params.require(:work_order).permit(:thecnician_id, :begining_attention_date, :ending_attention_date, :work_status_type_id)
    end

    def thecnician_params
      params.permit(:thecnician_id)
    end

    def ticket_format
      { ticket: { only: [:accident_date, :details], include: { client_branch: { only: [:address, :email], include: [{ client: { only: :name } }, { client_manager: { only: [:name, :last_name, :mother_last_name] } }] } } } }
    end

    def retainer_format
      { retainer: { only: :service_date, include: { client_branch: { only: [:address, :email], include: [{ client: { only: :name } }, { client_manager: { only: [:name, :last_name, :mother_last_name] } }] } } } }
    end
end
