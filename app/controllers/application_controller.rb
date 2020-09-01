require './config/environment'

class ApplicationController < Sinatra::Base

    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "trytofigurethisout"
    end

    get '/' do
        erb :index
    end

    helpers do

        def logged_in?
            # 1 ! negates.  double negation.  
            !!current_user
        end

        def current_user
            # ||= 'Or equals'.  A || B only checks the value of B if A is false.  
            @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
        end
    end


end