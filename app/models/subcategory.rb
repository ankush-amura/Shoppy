class Subcategory

  include Mongoid::Document
  include Mongoid::Timestamps




  field :name, type:  String , default: ""




  belongs_to :category
  has_many   :shops


 validates :name , presence: true
end
