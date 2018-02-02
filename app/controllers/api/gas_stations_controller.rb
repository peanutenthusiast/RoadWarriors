module Api

  class GasStationsController < ApplicationController
    def index 
      response = HTTParty.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{params[:latitude]},#{params[:longitude]}&radius=8500&type=gas_station&key=#{Figaro.env.google_places}" )
      sliced_stations = JSON.parse(response.body)["results"].slice(0, 10)
      render json: sliced_stations
    end
  end

end