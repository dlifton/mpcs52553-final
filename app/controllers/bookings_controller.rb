class BookingsController < ApplicationController

  def new
    u = User.find_by(id: session["user_id"])
    if u != nil
      @booking = Booking.new
      @booking.user = User.find_by(id: params['chef_id'])
      render 'new'
    else
      redirect_to "/sessions/new",  alert: "Sign In To Book"
    end
  end

  def create
    @booking = Booking.new
    @booking.chef_id = params['chef_id']
    @booking.user_id = session['user_id']
    @booking.date = params['date']
    if @booking.save
      redirect_to "/users/#{session['user_id']}", notice: 'Thanks for booking!'
    else
      render 'new'
    end
  end

  def edit
    @booking = Booking.find_by(id: params['id'])
    @chef = User.find_by(id: @booking.chef_id)
  end

  def update
    @booking = Booking.find_by(id: params['id'])
    @booking.date = params['date']
    if @booking.save
      redirect_to "/users/#{session["user_id"]}", notice: 'Booking Changed!'
    else
      render "new"
    end
  end

  def destroy
    booking = Booking.find_by(id: params['id'])
    booking.delete
    redirect_to "/users/#{session['user_id']}",  notice: 'Booking Deleted!'
  end

end