class FoodsController < ApplicationController

  def create
    @food = Food.new(food_image)
    @food.title = params['title']
    @food.description = params['description']
    @food.menu_id = params['menu_id']
    @food.user_id = session['user_id']
    if @food.save && params['edit'] == 'true'
      redirect_to "/menus/#{params['menu_id']}/edit"
    else
      render 'menus/addItems', :locals => { :menu_id => params['menu_id'] }
    end
  end

  def food_image
    params.require(:foods).permit(:foodimage)
  end

  def destroy
    if params.has_key?(:edit)
      if params['edit'] == 'true'
        food = Food.find_by(id: params['id'])
        food.delete
        redirect_to "/menus/#{params['menu_id']}/edit"
      end
    else
      food = Food.find_by(id: params['id'])
      food.delete
      render 'menus/addItems', :menu_id => params['menu_id']
    end
  end
end
