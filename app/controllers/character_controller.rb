class CharacterController < ApplicationController

    get '/characters' do
        if logged_in?
            @characters = current_user.characters
            erb :'characters/characters'
        else
            redirect to '/'
        end
    end
    
    post '/characters' do
        if logged_in?
            erb :'characters/characters'
        else
            redirect to '/'
        end
    end

    get '/character/:id' do
        if logged_in?
            @character = Character.find(params[:id])
            if @character && @character.user == current_user
                erb :'characters/show_character'
            else
                redirect to '/'
            end
        else
            redirect to '/'
        end
    end

    get '/character/:id/delete' do
        if logged_in?
            @character = Character.find(params[:id])
            if @character && @character.user == current_user
                @character.delete
            end
            redirect to '/characters'
        else
            redirect to '/'
        end
    end

    get '/add_character' do
        if logged_in?
            erb :'characters/add_character'
        else
            redirect to '/'
        end
    end

    post '/add_character' do
        if logged_in?
            name = params[:name]
            if ['!', '?', ';', '(', ')', '#'].any?{ |sym| name.include?(sym) } || name == ""
                redirect to '/add_character' 
            else
                @character = Character.new(
                    :name => params[:name],
                    :intellect => params[:intellect],
                    :strength => params[:strength],
                    :stamina => params[:stamina],
                    :agility => params[:agility],
                    :haste => params[:haste],
                    :versatility => params[:versatility],
                    :mastery => params[:mastery],
                    :crit_chance => params[:crit_chance]
                )
                @character.user_id = current_user.id
                @character.save
                redirect to '/characters'
            end
        else
            redirect to '/'
        end
    end

    get '/character/:id/edit' do
        if logged_in?
            @character = Character.find(params[:id])
            if @character && @character.user == current_user
                erb :'characters/edit_character'
            else
                redirect to 'character/:id'
            end
        else
            redirect to '/'
        end
    end

    post '/characters/:id/edit' do
        if logged_in?
            name = params[:name]
            if ['!', '?', ';', '(', ')', '#'].any?{ |sym| name.include?(sym) } || name == ""
                redirect to "/character/#{params[:id]}/edit"      
            else
                @character = Character.find(params[:id])
                @character.update(
                    :name => params[:name],
                    :intellect => params[:intellect],
                    :strength => params[:strength],
                    :stamina => params[:stamina],
                    :agility => params[:agility],
                    :haste => params[:haste],
                    :versatility => params[:versatility],
                    :mastery => params[:mastery],
                    :crit_chance => params[:crit_chance]
                )
                @character.save
                redirect to '/characters'
            end
        else
            redirect to '/'
        end
    end
end