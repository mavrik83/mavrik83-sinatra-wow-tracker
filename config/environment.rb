# frozen_string_literal: true

require 'sinatra/activerecord'
require 'bundler/setup'
Bundler.require

require_all 'app'

set :database, { adapter: 'sqlite3', database: 'db/wowtracker.sqlite' }
