class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    has_many :boats
    
    has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100"}, :default_url => "missing.png"
    
    validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/
    
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    
    # SEARCH BY FIRST NAME OR LAST NAME
    def self.search(search)
        where("fname LIKE ? OR lname LIKE ?", "%#{search}%", "%#{search}%")
    end
end
