class UsersController < ApplicationController

  get "/signup" do
    redirect to "/tweets" if logged_in? #redirects if user logged_in
    erb :"users/new"
  end

  post "/signup" do
    user = User.new(params)
    if user.save  #validates presence of username & password
      session[:user_id] = user.id
      redirect to "/tweets"
    end
    redirect to "/signup" #redirects if failed user creation
  end

  get "/login" do
    redirect to "/tweets" if logged_in?
    erb :"users/login"
  end

  post "/login" do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to "/tweets"
    end
  end

end
