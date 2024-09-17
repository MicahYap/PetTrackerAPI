require 'rails_helper'

RSpec.describe "VaxsControllers", type: :request do
  before do
    @user = create(:user)
    sign_in @user
  end

  describe "GET /index" do
    it 'returns all vax entries' do
      @pet = create(:pet, user: @user)
      vax1 = create(:vax, pet: @pet)
      get "/pets/#{@pet.id}/vaxs", params: { pet_id: @pet.id }

      # Check if the response status is 200 OK
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /create" do
    it 'creates new vax log' do
      @pet = create(:pet, user: @user)
      expect {
        post "/pets/#{@pet.id}/vaxs", params: {
          calendar: '2022-06-17',
          vet: 'MEVC',
          vaccine: 'anti-rabies',
          next_visit: '2023-06-17'
        }
      }.to change(Vax, :count).by(1)
    end
  end

end
