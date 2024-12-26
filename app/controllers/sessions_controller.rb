class SessionsController < ApplicationController

  def auth
    user = User.from_omniauth(request.env['omniauth.auth'])
    if user.valid?
      session[:user_id] = user.id 
      redirect_to user_path(user)
    else 
      redirect_to '/login'
    end

  end
end
