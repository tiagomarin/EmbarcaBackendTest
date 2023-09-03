# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Cities", type: :request do
  let!(:state1) { create(:state, name: "Paraná") }
  let!(:state2) { create(:state, name: "Santa Catarina") }

  let!(:city1) { create(:city, name: "Curitiba", state: state1) }
  let!(:city2) { create(:city, name: "Florianópolis", state: state2) }

  describe "GET index" do
    it "returns all cities when no params are passed" do
      get :index, params: { format: :json }
      expect(assigns(:cities)).to match_array([city1, city2]) # add all the cities you have created
    end

    it "returns cities in a case-insensitive manner" do
      get :index, params: { part_of_name: 'RIT', format: :json }
      expect(assigns(:cities)).to match_array([city1])
    end

    it "returns cities when search starts with a space" do
      get :index, params: { part_of_name: ' RIT', format: :json }
      expect(assigns(:cities)).to match_array([city1])
    end

    it "returns empty array when there are no matches" do
      get :index, params: { part_of_name: 'xyz', format: :json }
      expect(assigns(:cities)).to be_empty
    end

    it "returns cities filtered by state" do
      get :index, params: { state: "Paraná", format: :json }
      expect(assigns(:cities)).to match_array([city1])
    end

    it "returns cities filtered by part of the name" do
      get :index, params: { part_of_name: "rit", format: :json }
      expect(assigns(:cities)).to match_array([city1])
    end

    it "returns cities filtered by state and part of the name" do
      get :index, params: { state: 'Paraná', part_of_name: 'rit', format: :json }
      expect(assigns(:cities)).to match_array([city1])
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
      expect(json).to include(
        { 'id' => city1.id, 'name' => city1.name, 'state_id' => city1.state_id }
      )
    end
  end
end
