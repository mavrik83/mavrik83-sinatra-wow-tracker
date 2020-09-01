# Simple WoW Character Tracker

## Introduction

Welcome! This is a simple web app for keeping track of your World of Warcraft Characters and their stats. Usage is straight forward and simple: Once you are logged in, you can create characters, add stats to them, edit them, delete them, and view them. 

## Code Samples

I incorporated two helper methods:

    helpers do
        def logged_in?
            !!current_user
        end
    
        def current_user
            @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
        end
    end

I actually struggle at first to understand how the first method is working with the double bang operator (the first bang evaluates to a boolean of false, the second makes the statement true). This is useful since the return value of the #current_user is an object, not a boolean.

## Installation

In your favorite command prompt shell, run the following:

1. Run `bundle install`
2. Run `shotgun`
3. In a browser, go to URL `localhost:9393`

I have included some seed data. If you want to test out the app without having to create a bunch of users and characters, make sure to run `rake db:seed`.

Have fun!