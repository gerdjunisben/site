class SessionsController < ApplicationController
  def auth
    user = User.from_omniauth(request.env["omniauth.auth"])

    if user != nil && user.valid?
      session[:user_id] = user.id
      redirect_to "/posts/new"
    else
      redirect_to "/", alert: "You are not Ben."
    end
  end
end
