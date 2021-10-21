class Api::HeroesController < ApplicationController
  before_action :set_heros, only: [:show, :update, :destroy]

  # GET /heroes
  def index
    @heroes = Heros.all.sorted_by_name

    render json: @heroes
  end

  # GET /heroes/1
  def show
    render json: @heros
  end

  # POST /heroes
  def create
    @heros = Heros.new(heros_params)

    if @heros.save
      render json: @heros, status: :created, location: @heros
    else
      render json: @heros.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /heroes/1
  def update
    if @heros.update(heros_params)
      render json: @heros
    else
      render json: @heros.errors, status: :unprocessable_entity
    end
  end

  # DELETE /heroes/1
  def destroy
    @heros.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_heros
      @heros = Heros.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def heros_params
      params.require(:heros).permit(:name)
    end
end
