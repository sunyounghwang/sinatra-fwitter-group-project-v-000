class TweetsController < ApplicationController

  get "/tweets" do
    if logged_in?
      erb :"tweets/index"
    else
      redirect to "/login"  #redirects if user not logged_in
    end
  end
end
