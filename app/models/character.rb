# frozen_string_literal: true

class Character < ActiveRecord::Base
  belongs_to :user
end
