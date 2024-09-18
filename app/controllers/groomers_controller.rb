class GroomersController < ApplicationController
  include Rails.application.routes.url_helpers
  before_action :authenticate_user!

  def new
    @groomer = Groomer.new
    render json: @groomer
  end
  
  def create
    pet = Pet.find(params[:pet_id])
    @groomer = pet.groomers.create(groomer_params)

    if @groomer.save
      render json: @groomer, status: :created
    else
      render json: { errors: @groomer.errors.full_messages }, status: :unprocessable_entity

    end
  end

  def index
    pet = Pet.find(params[:pet_id])
    @groomer = pet.groomers

    render json: @groomer
  end

  def destroy
    pet = Pet.find(params[:pet_id])
    @groomer = pet.groomers.find(params[:id])

    if @groomer.destroy
      render json: { message: 'Grooming record successfully deleted.' }, status: :ok
    else
      render json: { error: 'Failed to delete Grooming record.' }, status: :unprocessable_entity
    end
  end

end

private
def groomer_params
  params.permit(:calendar, :groomer, :next_visit, :pet_id)
end

