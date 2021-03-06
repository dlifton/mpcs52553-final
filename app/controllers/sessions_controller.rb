class SessionsController < ApplicationController
  def index
  end

  def create
    u = User.find_by(email: params["email"])

    if u != nil
      if u.authenticate(params["password"])
        # cookies["user_id"] = u.id
        session["user_id"] = u.id
        session["user_type"] = params['user']
        redirect_to "/", notice: "Welcome back, #{u.name}!"
      else
        redirect_to "/sessions/new", alert: "Bad password"
      end
    else
      redirect_to "/sessions/new", alert: "Unknown user"
    end

  end

  def new
  end

  def destroy
    # cookies.delete("user_id")
    # cookies["user_id"] = nil
    reset_session
    redirect_to root_url, notice: "See ya!"
  end

end