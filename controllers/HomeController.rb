class HomeController < ApplicationController

  # all routes begin with /home

  get '/' do
    @newlogin = true

    if session[:logged_in]
      @username = session[:username]

      erb :home
    else
      @message = 'Welcome!'

      erb :login
    end
  end

  get '/login' do
    @message = 'Welcome'

    erb :login
  end

  get '/logout' do
    session.destroy

    redirect '/home/login'
  end

  post '/login' do
    username = params[:username]
    password = params[:password]

    user = User.find_by(username: username)
    if user && user.authenticate(password)
      session[:logged_in] = true
      session[:username] = username
      session[:user_id] = user.id

      erb :main
    else
      @message = "Hey beer goggles, wrong username or password."
      @newlogin = false

      erb :login
    end
  end

  post '/register' do
    username = params[:username]
    password = params[:password]

    user = User.find_by(username: username)
    if user
      @message = "Username is already taken. Take a shot and try again."
      @newlogin = false

      erb :login
    else
      user = User.new

      user.username = username
      user.password = password

      user.save

      erb :main

    end

  end

end
