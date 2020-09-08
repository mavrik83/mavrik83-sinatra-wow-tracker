# frozen_string_literal: true

# Models instances of characters
class Character < ActiveRecord::Base
  belongs_to :user
end
