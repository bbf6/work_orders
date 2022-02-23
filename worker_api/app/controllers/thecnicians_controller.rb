class ThecniciansController < ApplicationController
  before_action :set_thecnician, only: %i[ update destroy ]

  # GET /thecnicians
  def index
    @thecnicians = Thecnician.all
    render json: @thecnicians, include: :thecnician_phones
  end

  # GET /thecnicians/1
  def show
    @thecnician = Thecnician.where(id: params[:id]).first
    render json: @thecnician, include: :thecnician_phones
  end

  # POST /thecnicians
  def create
    @thecnician = Thecnician.new(thecnician_params)
    if @thecnician.save
      render json: @thecnician, status: :created, location: @thecnician
    else
      render json: @thecnician.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /thecnicians/1
  def update
    if @thecnician.update(thecnician_params)
      render json: @thecnician
    else
      render json: @thecnician.errors, status: :unprocessable_entity
    end
  end

  # DELETE /thecnicians/1
  def destroy
    @thecnician.update(status: false)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thecnician
      @thecnician = Thecnician.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def thecnician_params
      params.require(:thecnician).permit(:name, :last_name, :mother_last_name, :birth_date, :sex, :email, :pic, :status, thecnician_phones_attributes: [:description, :number])
    end
end
