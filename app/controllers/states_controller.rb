# frozen_string_literal: true

class StatesController < ApplicationController
  def index
    @states = State.includes(:cities).all

    respond_to do |format|
      format.json { render json: @states, include: [:cities] }
    end
  end
end
