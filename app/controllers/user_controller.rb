class UserController < ApplicationController

    get "/users/:slug" do
        @user = User.find_by_slug(params[:slug])
        erb :'users/show'
    end

    get '/signup' do
      end
    
          redirect to '/characters'
        else
          redirect to '/'
        end
      end
    
      end
    
end