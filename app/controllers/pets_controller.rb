class PetsController < ApplicationController
  include Rails.application.routes.url_helpers
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
  
    # Check if the pet has an attached vax_card
    vax_card_url = @pet.vax_card.attached? ? url_for(@pet.vax_card) : nil
    profile_picture_url = @pet.profile_picture.attached? ? url_for(@pet.profile_picture) : nil
    render json: {
      id: @pet.id,
      name: @pet.name,
      pet_type: @pet.pet_type,
      breed: @pet.breed,
      birthday: @pet.birthday,
      gotcha_day: @pet.gotcha_day,
      gender: @pet.gender,
      vax_card_url: vax_card_url,
      profile_picture_url: profile_picture_url
    }
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

  def upload
    pet = Pet.find(params[:id])  # Use :id to find the pet
    
    # Check if the pet belongs to the current user
    if pet.user_id == current_user.id
      if params[:vax_card].present?
        # Remove the old attachment asynchronously if it exists
        pet.vax_card.purge_later if pet.vax_card.attached?
        
        # Attach the new file
        pet.vax_card.attach(params[:vax_card])
  
        render json: { message: 'File uploaded successfully', vax_card_url: url_for(pet.vax_card) }, status: :ok
      else
        render json: { error: 'No file uploaded' }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Unauthorized' }, status: :forbidden
    end
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Pet not found' }, status: :not_found
  end

  def profile_picture
    pet = Pet.find(params[:id])
    if pet.user_id == current_user.id
      if params[:profile_picture].present?
        # Remove the old attachment asynchronously if it exists
        # pet.profile_picture.purge_later if pet.profile_picture.attached?
        
        # Attach the new file
        pet.profile_picture.attach(params[:profile_picture])
  
        render json: { message: 'File uploaded successfully', profile_picture_url: url_for(pet.profile_picture) }, status: :ok
      else
        render json: { error: 'No file uploaded' }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Unauthorized' }, status: :forbidden
    end
    rescue ActiveRecord::RecordNotFound
    render json: { error: 'Pet not found' }, status: :not_found
  end
  
  
  

  private

  def pet_params
    params.require(:pet).permit(:name, :pet_type, :breed, :birthday, :gotcha_day, :gender, :user_id)
  end

end
