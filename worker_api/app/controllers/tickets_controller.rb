class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[ update destroy ]

  # GET /tickets
  def index
    @tickets = Ticket.includes(client_branch: :client_manager)
    render json: @tickets, include: :client_branch
  end

  # GET /tickets/1
  def show
    @ticket = Ticket.includes(client_branch: :client_manager).where(id: params[:id]).first
    render json: @ticket, include: :client_branch
  end

  # POST /tickets
  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      render json: @ticket, status: :created, location: @ticket
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tickets/1
  def update
    if @ticket.update(ticket_params)
      render json: @ticket
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tickets/1
  def destroy
    @ticket.update(status: false)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ticket_params
      params.require(:ticket).permit(:id, :accident_date, :details, :client_branch_id)
    end
end
