class UserController < ApplicationController

    get "/users/:slug" do
        @user = User.find_by_slug(params[:slug])
        erb :'users/show'
    end

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
      if ['!', '?', ';', '(', ')', '#'].any?{ |sym| name.include?(sym) || email.include?(sym) } || name == "" || email == "" || params[:password] == ""
        redirect to '/signup'
      else
        @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
        if @user.save
          session[:user_id] = @user.id
          redirect to '/characters'
        else
          redirect to '/'
        end
      end
    end
    
      end
    
end