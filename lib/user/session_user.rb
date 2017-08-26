class SessionUser
  attr_reader :name, :uid, :token, :secret

  def initialize(session)
    @name = session[:name]
    @nickname = session[:nickname]
    @uid = session[:user_id]
    @discription = session[:description]
    @image = session[:image]
    @location = session[:location]
    @website = session[:website]
    @token = session[:oauth_token]
    @secret = session[:oauth_token_secret]
  end
end
