class Recipe < ApplicationRecord
    validates_presence_of :name, :category, :ingredients, :instructions, :rating
end
