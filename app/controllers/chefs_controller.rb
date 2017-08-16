class ChefsController < ApplicationController

  def create
    @chef = Chef.new
    @chef.name = params["name"]
    @chef.email = params["email"]
    @chef.phone = params["phone"]
    @chef.password = params["password"]
    @chef.save
    if @chef.save
      redirect_to root_url, notice: "Thanks for signing up!"
    else
      render 'new'
    end
  end

  def index
    @chefs = User.where(role: 'Chef')
    @chefs = @chefs.page(params["page"]).per(12)

    #if user uses the search query
    if params.has_key?(:date)

      if params[:date].blank?
        @chefs = User.where(role: 'Chef')
      else
        @chefs = User.where(role: 'Chef')
        @chefs = @chefs.to_a
        @booking = Booking.where(date: params[:date])
        @booking.each do |b|
          @chefs.delete(User.find_by(id: b.user.id))
        end
      end
    end

    if params.has_key?(:cuisine)
      if params[:cuisine].blank?
        @chefs = User.where(role: 'Chef')
      else
        @chefs = User.where(cuisine: params[:cuisine])
      end
    end

    @chefs = @chefs.page(params["page"]).per(12)
  end

  def new
  end

  def show
    @chef = User.find_by(id: params["id"])
  end
end