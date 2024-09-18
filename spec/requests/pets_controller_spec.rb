require 'rails_helper'

RSpec.describe "PetsControllers", type: :request do
  before do
    @user = create(:user)
    sign_in @user
  end

  let(:valid_attributes) do
    {
      name: 'Reese',
    pet_type: 'rabbit',
    breed:'Netherland Dwarf',
    birthday: '2022-06-17',
    gotcha_day:'2022-10-21',
    gender: 'female'
    }
  end

  describe "GET /index" do
   it 'returns all pet entries' do
    @pet = create(:pet, user: @user)

    get "/pets", params: {
      pet_id: @pet.id
    }

    expect(response).to have_http_status(:success)
   end
  end

  describe "POST /create" do
    it 'creates new vet log' do
      @pet = create(:pet, user: @user)
      expect {
        post "/pets", params: {
          name: 'Reese',
          pet_type: 'rabbit',
          breed: 'holland lop',
          birthday: '2023-06-17',
          gotcha_day: '2023-08-17',
          gender: 'Female'
        }
      }.to change(Pet, :count).by(1)
    end
  end

  describe "PATCH /update" do
    it 'updates pet info' do
      @pet = create(:pet, user: @user)
  
        patch "/pets/#{@pet.id}/edit_profile", params: {pet: valid_attributes}
      expect(response).to have_http_status(:ok)
      
    end
  end
end
