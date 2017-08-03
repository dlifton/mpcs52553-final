class MenusController < ApplicationController
  def new
    @chef= Menu.new
  end

  def create
    @chef = Menu.new
    @chef.title = params["title"]
    @chef.price = params["price"].to_f * 100
    @chef.description = params["description"]
    @chef.photo_url = params["photo_url"]
    if @chef.save
      redirect_to root, notice: 'Product successfully created.'
    else
      render "new"
    end
  end
end
