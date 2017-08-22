class SessionsController < ApplicationController
  def callback
    auth = request.env['omniauth.auth']
    session[:user_id] = auth['uid']
    session[:name] = auth['info']['name']
    session[:oauth_token] = auth['credentials']['token']
    session[:oauth_token_secret] = auth['credentials']['secret']
    redirect_to "/tweet"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
