# frozen_string_literal: true

class CitiesController < ApplicationController
  def index
    part_of_name = params[:part_of_name]&.strip
    @cities = if params[:state] || part_of_name
                # Perform the search and filtering
                City.where("name ILIKE ?", "%#{part_of_name}%")
                    .where(state: State.where("name ILIKE ?", "%#{params[:state]}%"))
              else
                # Return all cities
                City.all
              end

    respond_to do |format|
      format.json { render json: @cities }
    end
  end
end
