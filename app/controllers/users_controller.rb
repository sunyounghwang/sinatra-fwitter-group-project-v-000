class UsersController < ApplicationController

  get "/users/" do
    erb :"users/show"
  end

end
