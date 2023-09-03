# frozen_string_literal: true

module CitySearchable
  extend ActiveSupport::Concern

  private

  def fetch_cities
    if city_search_params[:state_id] || city_search_params[:part_of_name]
      build_city_query.includes(:state)
    else
      City.includes(:state).all
    end
  end

  def build_city_query
    query = City.all
    query = apply_name_filter(query)
    apply_state_filter(query)
  end

  def city_search_params
    {
      part_of_name: params[:city_search]&.strip,
      state_id: params[:state_id]
    }
  end

  def apply_name_filter(query)
    if city_search_params[:part_of_name].present?
      query.where("name ILIKE ?", "%#{city_search_params[:part_of_name]}%")
    else
      query
    end
  end

  def apply_state_filter(query)
    if city_search_params[:state_id].present?
      query.where(state_id: city_search_params[:state_id])
    else
      query
    end
  end
end
