class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def show

    @restaurant = Restaurant.find(params[:id])
    @review = Review.new

  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    #binding.pry
    if @restaurant.save
      flash[:notice] = "You've successfully added a restaurant!"
      redirect_to restaurants_path
    else
       flash.now[:notice] = "There were problems processing your request!"
      render :new
    end

  end



    def edit
      @restaurant = Restaurant.find(params[:id])
    end

  def update

    @restaurant = Restaurant.find(params[:id])

    if @restaurant.update(restaurant_params)

    else
      render "form"
    end

  redirect_to restaurants_path
  end

    def destroy
      @restaurant = Restaurant.find(params[:id])
      @restaurant.destroy
      redirect_to restaurants_path
    end



private

  def restaurant_params
    params.require(:restaurant).permit(:name,:address, :city, :state, :zip_code, :description, :category)
  end
end
