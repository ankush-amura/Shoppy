class Shop < ApplicationRecord

  # shop belongs to property as a table that acts as a refrence table for other models
  belongs_to :property , polymorphic: true

  # each shop is said to have many reviews that are given by the customers
  has_many   :reviews

  # validating name with attribute presence otherwise the shop is not inserted in table
  validates :name,      presence: true

end
