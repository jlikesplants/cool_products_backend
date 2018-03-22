class AdvertisersController < ApplicationController
  def index
    @advertisers = Advertiser.all
    render json: @advertisers
  end
end
