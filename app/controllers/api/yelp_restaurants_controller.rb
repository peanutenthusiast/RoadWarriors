class YelpRestaurantsController < ApplicationController
  def results(lat, long)
# https://api.yelp.com/v3/businesses/search?term=food&latitude=${latitude}&longitude=${longitude}&radius=8500
  end
end

# axios({ method: 'get', url: `https://api.yelp.com/v3/businesses/search?term=food&latitude=${latitude}&longitude=${longitude}&radius=8500`, headers: { 'authorization': Config.YelpApi } }).catch(response => { console.log(response); }),
#         axios({ method: 'get', url: `https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${latitude},${longitude}&radius=8500&type=gas_station&key=${Config.GooglePlaces}` }).catch(response => { console.log(response); })