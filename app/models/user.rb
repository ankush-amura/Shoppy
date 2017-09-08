class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
      #and that should be reflected in database
    has_many :superadmins, class_name: "User"
    has_many :moderators, class_name: "User",foreign_key: "superadmin_id"
    has_many :sales , class_name: "User",foreign_key: "moderator_id"
    has_many :shops
    belongs_to :moderator, class_name: "User" , optional: true
    belongs_to :superadmin , class_name: "User", optional: true
    validates :name, presence: true
    validates :email,presence:true
    validates :password,presence:true
    validates :contact , presence:true
end
