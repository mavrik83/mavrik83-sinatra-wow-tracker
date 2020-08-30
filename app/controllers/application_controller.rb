require './config/environment'

class ApplicationController < Sinatra::Base

    configure do
        set :public_folder, 'pubic'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "trytofigurethisout"
    end

    get '/' do
        erb :index
    end

    helpers do

        def logged_in?
            !!current_user
        end

        def current_user
            @current_user ||= User.find_by(id: session[:user_is]) if session[:user_id]
        end
    end


end