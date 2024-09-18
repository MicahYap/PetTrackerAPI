# app/controllers/vets_controller.rb

class VetsController < ApplicationController
  include Rails.application.routes.url_helpers
  before_action :authenticate_user!

  def index
    pet = Pet.find(params[:pet_id])
    @vets = pet.vets
    render json: @vets
  end

  def create
    @pet = Pet.find(params[:pet_id])
    @vet = @pet.vets.build(vet_params)
    if @vet.save
      render json: @vet, status: :created
    else
      render json: { error: 'Failed to create vet record' }, status: :unprocessable_entity
    end
  end

  def destroy
    @pet = Pet.find(params[:pet_id])
    @vet = @pet.vets.find(params[:id])
    if @vet.destroy
      render json: { message: 'Vet record deleted' }, status: :ok
    else
      render json: { error: 'Failed to delete vet record' }, status: :unprocessable_entity
    end
  end

  private

  def vet_params
    params.require(:vet).permit(:calendar, :vet, :concern, :next_visit)
  end
end
