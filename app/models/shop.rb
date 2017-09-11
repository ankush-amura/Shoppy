class Shop

  include Mongoid::Document
  include Mongoid::Timestamps





  field :name, type: String,default: ""
  field :approve_status, type: String , default: '0'
  belongs_to :city
  belongs_to :area
  belongs_to :user
  belongs_to :category
  belongs_to :subcategory
  has_many   :reviews






  validates :name,      presence: true

end
