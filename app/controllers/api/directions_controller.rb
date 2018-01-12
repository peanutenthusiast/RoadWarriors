module Api

  class DirectionsController < ApplicationController
    def index
      response = HTTParty.get("https://maps.googleapis.com/maps/api/directions/json?origin=#{latitude},#{longitude}&destination=#{destination}&key=${ Figaro.env.google_directions}")
      points = JSON.parse(response.body)["routes"][0]["overview_polyline"]["points"]
      render json: points
    end
  end

end
