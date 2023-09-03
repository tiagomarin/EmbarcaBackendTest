# frozen_string_literal: true

class CitiesController < ApplicationController
  include CitySearchable

  def index
    @states = State.all
    @filtered_cities = fetch_cities

    respond_to do |format|
      format.html
      format.json { render json: @filtered_cities }
    end
  end
end
