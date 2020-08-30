class CharacterController < ApplicationController

    get '/characters' do
        if logged_in?
            @characters = Character.all
            erb :'users/show'
        else
            redirect to '/'
        end
    end

end