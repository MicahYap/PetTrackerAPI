class VaxsController < ApplicationController
  include Rails.application.routes.url_helpers
  before_action :authenticate_user!

  def new
    @vax = Vax.new
    render json: @vax
  end

  def create
    pet = Pet.find(params[:pet_id])
    @vax = pet.vaxs.build(vax_params)

    if @vax.save
      render json: @vax, status: :created
    else
      render json: @vax.error, status: :unprocessable_entity
    end
  end

  def index
    pet = Pet.find(params[:pet_id])
    @vax = pet.vaxs

    render json: @vax
  end

  private

  def vax_params
    params.require(:vax).permit(:calendar, :vet, :vaccine, :next_visit, :pet_id)
  end



end
