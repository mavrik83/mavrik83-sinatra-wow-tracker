class CharacterController < ApplicationController

    post '/characters' do
        if logged_in?
            #@characters = Character.all
            erb :'characters/characters'
        else
            redirect to '/'
        end
    end



end