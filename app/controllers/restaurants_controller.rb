class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]


  def italian
    @restaurants = Restaurant.where(category: "italian")
  end
  # GET /restaurants
  # GET /restaurants.json
  def index
    @restaurants = Restaurant.all
    @restaurants = @restaurants.where(category: params[:category]) if !params[:category].blank?
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit
  end


  # POST /restaurants
  # POST /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    @restaurant.update(restaurant_params)
  end


  def destroy
    @restaurant.destroy
  end

  private
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    def restaurant_params
      params.require(:restaurant).permit(:name, :address, :category, :phone_number)
    end
end
