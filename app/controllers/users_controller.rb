class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new
    user.name = params['name']
    user.email = params['email']
    user.password = params['password']
    user.role = params['role']
    user.save
    redirect_to root_url, notice: "Thanks for signing up!"
  end

  def index
  end

  def show
    @user = User.find_by(id: params["id"])

    if @user.present? && @user.id == session["user_id"]
      @bookings = @user.bookings
      @menus = @user.menus
    else
      redirect_to root_url, notice: "Nice try!"
    end
  end

  def update
    @user = User.find_by(id: params['id'])
    @user.update_attributes(post_params)
    @bookings = @user.bookings
    @menus = @user.menus
    render 'show'
  end

  def post_params
    params.require(:user).permit(:avatar)
  end


end
