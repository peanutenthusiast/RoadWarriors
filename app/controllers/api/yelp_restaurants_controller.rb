module Api


  class YelpRestaurantsController < ApplicationController
    def index
  # https://api.yelp.com/v3/businesses/search?term=food&latitude=${latitude}&longitude=${longitude}&radius=8500
      response = HTTParty.get("https://api.yelp.com/v3/businesses/search?term=food&latitude=#{params[:latitude]}&longitude=#{params[:longitude]}&radius=8500", headers: { 'authorization': Figaro.env.yelp_api
   })
      sliced_businesses = JSON.parse(response.body)["businesses"].slice(0, 10)
      render json: sliced_businesses
    end


  end
end
# axios({ method: 'get', url: `https://api.yelp.com/v3/businesses/search?term=food&latitude=${latitude}&longitude=${longitude}&radius=8500`, headers: { 'authorization': Config.YelpApi } }).catch(response => { console.log(response); }),
#         axios({ method: 'get', url: `https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${latitude},${longitude}&radius=8500&type=gas_station&key=${Config.GooglePlaces}` }).catch(response => { console.log(response); })