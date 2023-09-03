# frozen_string_literal: true

require "rails_helper"

RSpec.describe "States", type: :request do
  let!(:state1) { create(:state, name: "Paraná") }
  let!(:state2) { create(:state, name: "Santa Catarina") }

  let!(:city1) { create(:city, name: "Curitiba", state: state1) }
  let!(:city2) { create(:city, name: "Florianópolis", state: state2) }

  describe "GET /index" do
    it "returns all states" do
      get :index, params: { format: :json }
      expect(assigns(:states)).to match_array([state1, state2])
    end

    it "returns states along with associated cities" do
      get :index, params: { format: :json }
      expect(assigns(:states).first.cities).to match_array([city1])
    end

    it "returns a 200 OK status" do
      get :index, params: { format: :json }
      expect(response).to have_http_status(200)
    end

    it "returns JSON data" do
      get :index, params: { format: :json }
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end

    it "returns the correct JSON structure" do
      get :index, params: { format: :json }
      json = JSON.parse(response.body)
      expect(json[0]["id"]).to eq(state1.id)
      expect(json).to include(
        {
          "id" => state1.id,
          "name" => state1.name,
          "cities" => [
            { "id" => city1.id, "name" => city1.name, "state_id" => city1.state_id }
          ]
        }
      )
    end
  end
end
