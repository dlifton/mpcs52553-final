class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @booking.chef = Chef.find_by(id: params['chef_id'])
    render 'new'
  end

  def create
    @booking = Booking.new
    @booking.chef_id = params['chef_id']
    @booking.user_id = session['user_id']
    @booking.booking_date_time = params['date']
    if @booking.save
      redirect_to "/users/#{session['user_id']}", notice: 'Thanks for booking!'
    else
      render 'new'
    end
  end

  def edit
    @booking = Booking.find_by(id: params['id'])
  end

  def update
    @booking = Booking.find_by(id: params['id'])
    @booking.booking_date_time = params['date']
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