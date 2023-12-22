class Title < ApplicationRecord
  has_many :user_titles
  has_many :users, through: :user_titles
end
