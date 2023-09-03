# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Cities", type: :request do
  let!(:state1) { create(:state, name: "Paraná") }
  let!(:state2) { create(:state, name: "Santa Catarina") }

  let!(:city1) { create(:city, name: "Curitiba", state: state1) }
  let!(:city2) { create(:city, name: "Florianópolis", state: state2) }

  describe "GET index" do
    it "returns all cities when no params are passed" do
      get "/cities", params: { format: :json }
      json = JSON.parse(response.body)
      expect(json.map { |city| city["id"] }).to match_array([city1.id, city2.id])
    end

    it "returns cities in a case-insensitive manner" do
      get "/cities", params: { city_search: "RIT", format: :json }
      json = JSON.parse(response.body)
      expect(json.map { |city| city["id"] }).to match_array([city1.id])
    end

    it "returns cities when search starts with a space" do
      get "/cities", params: { city_search: " RIT", format: :json }
      json = JSON.parse(response.body)
      expect(json.map { |city| city["id"] }).to match_array([city1.id])
    end

    it "returns empty array when there are no matches" do
      get "/cities", params: { city_search: "xyz", format: :json }
      json = JSON.parse(response.body)
      expect(json).to be_empty
    end

    it "returns cities filtered by state" do
      get "/cities", params: { state_id: state1.id, format: :json }
      json = JSON.parse(response.body)
      expect(json.map { |city| city["id"] }).to match_array([city1.id])
    end

    it "returns cities filtered by part of the name" do
      get "/cities", params: { city_search: "rit", format: :json }
      json = JSON.parse(response.body)
      expect(json.map { |city| city["id"] }).to match_array([city1.id])
    end

    it "returns cities filtered by state and part of the name" do
      get "/cities", params: { state: "Paraná", city_search: "rit", format: :json }
      json = JSON.parse(response.body)
      expect(json.map { |city| city["id"] }).to match_array([city1.id])
    end

    it "returns a 200 OK status" do
      get "/cities", params: { format: :json }
      expect(response).to have_http_status(200)
    end

    it "returns JSON data" do
      get "/cities", params: { format: :json }
      expect(response.content_type).to start_with("application/json")
    end

    it "returns the correct JSON structure" do
      get "/cities", params: { format: :json }
      json = JSON.parse(response.body)
      expect(json).to include(
        { "id" => city1.id,
          "name" => city1.name,
          "state_id" => city1.state_id,
          "created_at" => city1.created_at.as_json,
          "updated_at" => city1.updated_at.as_json }
      )
    end
  end
end
