# frozen_string_literal: true

require "rails_helper"

RSpec.describe "cities/index.html.erb", type: :view do
  before do
    assign(:states, [create(:state, name: "Paraná")])
    assign(:filtered_cities, [])
    render
  end

  it "has a form for city search" do
    assert_select "form.search-form[method=?][action=?]", "get", "/cities"
  end

  it "has a state selection dropdown" do
    assert_select "select[name=?]", "state_id"
  end

  it "has a city search box" do
    assert_select "input[type=?][name=?]", "text", "city_search"
  end

  it "has a search button" do
    assert_select "input[type=?][value=?]", "submit", "Buscar"
  end

  it "has a results div" do
    assert_select "div#results"
  end
end
