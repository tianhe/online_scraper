class TravelZooDealsController < ApplicationController
  def index
    @scrape_dates = TravelZooDeal.all.map(&:effective_date).uniq
  end

  def show
    @deals = TravelZooDeal.where(:effective_date => params[:date])
  end
end