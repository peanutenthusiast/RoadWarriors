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
# 
