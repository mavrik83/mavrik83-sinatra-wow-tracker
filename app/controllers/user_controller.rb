# frozen_string_literal: true

# user controller class
class UserController < ApplicationController
  get '/signup' do
    if !logged_in?
      erb :'users/create_user'
    else
      redirect to '/characters'
    end
  end

  post '/signup' do
    name = params[:username]
    email = params[:email]
    if ['!', '?', ';', '(', ')', '#'].any? { |sym| name.include?(sym) || email.include?(sym) } || name == '' || email == '' || params[:password] == ''
      redirect to '/signup'
    else
      @user = User.new(username: params[:username], email: params[:email], password: params[:password])
      if @user.save
        session[:user_id] = @user.id
        redirect to '/characters'
      else
        redirect to '/'
      end
    end
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect to '/characters'
    end
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to '/characters'
    else
      flash[:error] = 'Please enter valid credentials or signup'
      redirect to '/'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
    else
      redirect to '/'
    end
    redirect to '/'
  end
end
