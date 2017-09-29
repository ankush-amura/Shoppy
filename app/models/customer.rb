class Customer

    include Mongoid::Document
    include Mongoid::Timestamps
   # this is the callback that needs to perform capitalization opoeration as soon as customer is created
   #after_initialize do |user|
   #  puts "u have Successfully Created A customer"
   # user.name.capitalize!
   #end

   # this callback is responsible for updating the contact to some country code
   #before_save do |user|
   #user.contact="+91 "+user.contact
   #end

   # validates the presence of name while submitting the data to the database model


  field :name,       type: String,    default: ""
  field :email,      type: String,    default: ""
  field :password,   type: String,    default: ""
  field :contact,    type: String,    default: ""





   validates :name, presence: true
   # validates the confirmation of the email if both the written emails are same
   validates :email ,presence: true

   # validates password with confirmation and uniqueness and length attributes
   validates :password,presence: true

   # validates contact info for its uniqueness and numericality
   validates :contact,presence: true

   has_many :reviews
 end
