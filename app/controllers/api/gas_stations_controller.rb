module Api

  class GasStationsController < ApplicationController
    def index 
      response = HTTParty.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{params[:latitude]},#{params[:longitude]}&radius=8500&type=gas_station&key=#{Figaro.env.google_places}" )
      results = JSON.parse(response.body)["results"]
      p results
      render json: results
    end
  end

end