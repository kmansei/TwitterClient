class SessionsController < ApplicationController
  def callback
    auth = request.env['omniauth.auth']
    session[:user_id] = auth['uid']
    session[:name] = auth['info']['name']
    session[:description] = auth['info']['description']
    session[:image] = auth['info']['image']
    session[:nickname] = auth['info']['nickname']
    session[:location] = auth['info']['location']
    session[:website] = auth['info']['urls'][:Website]
    session[:oauth_token] = auth['credentials']['token']
    session[:oauth_token_secret] = auth['credentials']['secret']
    redirect_to home_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
