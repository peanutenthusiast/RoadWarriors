module Api

  class GasStationsController < ApplicationController
    def index 
      response = HTTParty.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{params[:latitude]},#{params[:longitude]}&radius=500&type=gas_station&key=#{ Figaro.env.google_places}" )

      results = response["results"]
      render json: results
    end
  end

end

#         axios({ method: 'get', url: `https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${latitude},${longitude}&radius=8500&type=gas_station&key=${Config.GooglePlaces}` }).catch(response => { console.log(response); })