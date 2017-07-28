class AttractionsController < ApplicationController
  before_action :current_user

  def index
    @attractions = Attraction.all
  end

  def new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def show
    @attraction = Attraction.find(params[:id])
    @ride = Ride.new(attraction: @attraction)
  end

  def edit
    @attraction = Attraction.find_by(id: params[:id])
  end

  def update
    # binding.pry
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  private
  def attraction_params
    params.require(:attraction).permit(:name, :nausea_rating, :happiness_rating, :tickets, :min_height)
  end
end
