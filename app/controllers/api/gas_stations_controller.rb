module Api

  class GasStationsController < ApplicationController
    def index
      response = HTTParty.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${latitude},${longitude}&radius=500&type=gas_station&key=${ Figaro.env.google_places}" )

https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=500&type=restaurant&keyword=cruise&key=

      render json: response
    end
  end

end

#         axios({ method: 'get', url: `https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${latitude},${longitude}&radius=8500&type=gas_station&key=${Config.GooglePlaces}` }).catch(response => { console.log(response); })