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


end