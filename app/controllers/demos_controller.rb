class DemosController < ApplicationController
  def index
    render json: { RAILS_ENV: ENV['RAILS_ENV'] }
  end
end
