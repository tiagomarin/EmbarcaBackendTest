# frozen_string_literal: true

require "rails_helper"

RSpec.describe "cities/search.html.erb", type: :view do
  it "has a state selection dropdown" do
    render
    assert_select "select[name=?]", "state"
  end

  it "has a city search box" do
    render
    assert_select "input[type=?][name=?]", "text", "city_search"
  end

  it "has a search button" do
    render
    assert_select "button[type=?]", "submit"
  end
end
