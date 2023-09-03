# frozen_string_literal: true

require "rails_helper"

RSpec.describe "States", type: :request do
  let!(:state1) { create(:state, name: "Paraná") }
  let!(:state2) { create(:state, name: "Santa Catarina") }
  let!(:city1) { create(:city, name: "Curitiba", state: state1) }
  let!(:city2) { create(:city, name: "Florianópolis", state: state2) }

  before(:each) do
    get "/states", params: { format: :json }
  end

  describe "GET /index" do
    it "returns all states" do
      expect(JSON.parse(response.body).map { |state| state["id"] }).to match_array([state1.id, state2.id])
    end

    it "returns states along with associated cities" do
      json = JSON.parse(response.body)
      expect(json.find do |state|
               state["id"] == state1.id
             end["cities"]).to include(hash_including(
                                         "id" => city1.id,
                                         "name" => city1.name,
                                         "state_id" => city1.state_id
                                       ))
    end

    it "returns a 200 OK status" do
      expect(response).to have_http_status(200)
    end

    it "returns JSON data" do
      expect(response.content_type).to start_with("application/json")
    end

    it "returns the correct JSON structure" do
      actual_state1 = JSON.parse(response.body).find { |state| state["id"] == state1.id }
      expect(actual_state1).to include(
        "id" => state1.id,
        "name" => state1.name,
        "cities" => array_including(
          hash_including("id" => city1.id, "name" => city1.name, "state_id" => city1.state_id)
        )
      )
    end
  end
end
