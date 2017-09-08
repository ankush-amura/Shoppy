class Review
  include Mongoid::Document
  include Mongoid::Timestamps
  # Each review that is provided by the customer should belong to a particular shop
  # and that should be reflected in database
   field :message, type: String, default: ""
   belongs_to :shop
   belongs_to :customer

    has_many :replies, class_name: "Review",foreign_key: "comment_id"


    belongs_to :comment, class_name: "Review" , optional: true

    validates :message, presence: true
end
