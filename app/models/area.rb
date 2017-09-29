class Area

    include Mongoid::Document
    include Mongoid::Timestamps

   field :name, type: String ,default: ""




   # An area can have multiple shops hence this association
   has_many   :shops

   # a particular area belongs to a city
   belongs_to :city
 end
