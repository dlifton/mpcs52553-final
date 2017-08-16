class MenusController < ApplicationController
  def index
    @menus = Menu.all
    @menus = @menus.page(params["page"]).per(12)
  end

  def edit
    @menu = Menu.find_by(id: params['id'])
  end
  def new
    @menu = Menu.new
  end

  def show
    @menu = Menu.find_by(id: params['id'])
  end

  def create
    user_id = session['user_id']
    @menu = Menu.new(menu_pic_params)
    @menu.title = params["title"]
    @menu.price = params["price"].to_f * 100
    @menu.description = params["description"]
    @menu.cuisine = params["cuisine"]
    @menu.user_id = user_id
    if @menu.save
      render 'addItems', :locals => { :menu_id => @menu.id }
    else
      render "new"
    end
  end

  def menu_pic_params
    params.require(:menu).permit(:menuimage)
  end

  def addItems
  end

  def destroy
    menu = Menu.find_by(id: params['id'])
    menu.delete
    redirect_to "/users/#{session['user_id']}"
  end
end
