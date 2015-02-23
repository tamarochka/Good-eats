class ReviewsController < ApplicationController

  def index
    @reviews = Review.where(:restaurant_id == params["restaurant"][:id])
  end

  def new
    @review = Review.new
  end



  def create
    @review = Review.new(restaurant_id: params["restaurant_id"], body: params["review"][:body], rating: params["review"][:rating])

    #binding.pry
    if @review.save
      flash[:notice] = "You've successfully added a review!"
      redirect_to restaurant_path(@review.restaurant)
    else
       flash.now[:notice] = "There were problems processing your request!"
    end

  end

end
