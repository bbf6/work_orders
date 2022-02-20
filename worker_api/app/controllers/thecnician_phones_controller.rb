class ThecnicianPhonesController < ApplicationController
  before_action :set_thecnician_phone, only: %i[ show update destroy ]

  # GET /thecnician_phones
  def index
    @thecnician_phones = ThecnicianPhone.all

    render json: @thecnician_phones
  end

  # GET /thecnician_phones/1
  def show
    render json: @thecnician_phone
  end

  # POST /thecnician_phones
  def create
    @thecnician_phone = ThecnicianPhone.new(thecnician_phone_params)

    if @thecnician_phone.save
      render json: @thecnician_phone, status: :created, location: @thecnician_phone
    else
      render json: @thecnician_phone.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /thecnician_phones/1
  def update
    if @thecnician_phone.update(thecnician_phone_params)
      render json: @thecnician_phone
    else
      render json: @thecnician_phone.errors, status: :unprocessable_entity
    end
  end

  # DELETE /thecnician_phones/1
  def destroy
    @thecnician_phone.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thecnician_phone
      @thecnician_phone = ThecnicianPhone.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def thecnician_phone_params
      params.require(:thecnician_phone).permit(:thecnician_id, :description, :number, :status)
    end
end
