class ChefsController < ApplicationController

  def create
    @chef = Chef.new
    @chef.name = params["name"]
    @chef.email = params["email"]
    @chef.phone = params["phone"]
    @chef.password = params["password"]
    if @chef.save
      redirect_to root_url, notice: "Thanks for signing up!"
    else
      render 'new'
    end
  end

  def index
    @cuisines = Chef.all.collect(&:cuisine).uniq
    if params.has_key?(:cuisine)
      @chefs = Chef.where(cuisine: params[:cuisine][:name])
    else
      @chefs = Chef.all
    end
  end

  def new
  end

  def show
    @chef = Chef.find_by(id: params["id"])
  end
end