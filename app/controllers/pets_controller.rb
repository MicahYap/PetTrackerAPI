class PetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @pets = current_user.pets
    render json: @pets
  end

  def new
    @pet = Pet.new
    render json: @pet
  end
  
  def create
    @pet = current_user.pets.build(pet_params)
    if @pet.save
      render json: @pet, status: :created
    else
      render json: @pet.errors, status: :unprocessable_entity
    end
  end

  def edit
    @pet = Pet.find(params[:id])
    render json: @pet
  end

  def update
    @pet = Pet.find(params[:id])
    if @pet.update(pet_params)
      render json: @pet, status: :ok
    else
      render json: @pet.errors, status: :unprocessable_entity
    end
  end

  def show
    @pet = Pet.find(params[:id])
    render json: @pet
  end

  def destroy
    @pet = Pet.find(params[:id])
  
    if @pet.destroy
      # Render a success message or the deleted pet object
      render json: { message: 'Pet deleted successfully', pet: @pet }, status: :ok
    else
      # Handle the case where deletion fails (e.g., due to a validation error)
      render json: { error: 'Failed to delete pet' }, status: :unprocessable_entity
    end
  end
  

  private

  def pet_params
    params.require(:pet).permit(:name, :pet_type, :breed, :birthday, :gotcha_day, :gender, :user_id)
  end

end
