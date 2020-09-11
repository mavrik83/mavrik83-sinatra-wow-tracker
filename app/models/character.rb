# frozen_string_literal: true

# model class for new character isntances
class Character < ActiveRecord::Base
  belongs_to :user
end
