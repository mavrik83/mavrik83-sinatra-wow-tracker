# frozen_string_literal: true

# model class for new user instances
class User < ActiveRecord::Base
  has_many :characters
  validates :email, uniqueness: { case_sensitive: false }
  validates :username, uniqueness: { case_sensitive: false }
  has_secure_password

  def slug
    username.downcase.gsub(' ', '-')
  end

  def self.find_by_slug(slug)
    User.all.find { |user| user.slug == slug }
  end
end
