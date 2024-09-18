require 'rails_helper'

RSpec.describe GroomersController, type: :request do
  before do
    # Create a user and sign in
    @user = FactoryBot.create(:user) # Adjust according to your factory setup
    sign_in @user
  end

  describe "GET #index" do
    it 'returns a successful response' do
      @pet = create(:pet, user: @user) 
      get "/pets/#{@pet.id}/groomers", params: { pet_id: @pet.id }

      # Check if the response status is 200 OK
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST #create" do
    it 'returns a new groomer log' do
      @pet = create(:pet, user: @user)
      expect {
        post "/pets/#{@pet.id}/groomers", params: {calendar: '2022-06-17', groomer: 'VIP', next_visit: '2022-07-17'}
      }.to change(Groomer, :count).by(1)
    end
  end

  describe "Delete #destroy" do
    it 'deletes groomer entry' do
      @pet = create(:pet, user: @user)
      @groomer = create(:groomer, pet: @pet)
      expect {
        delete "/pets/#{@pet.id}/groomers/#{@groomer.id}"
    }.to change(Groomer, :count).by(-1)
    end
  end 
end
