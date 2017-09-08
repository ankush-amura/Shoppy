class Category
  include Mongoid::Document
  include Mongoid::Timestamps


  field :name  ,   type: String  ,  default: ""



  # A particular category of shop can have many shops within and so this relation is specified
  has_many :shops
  has_many :subcategories




  # validation is provided for category attribute for its presence and uniqueness
  validates :name, presence: true, uniqueness: true
end
