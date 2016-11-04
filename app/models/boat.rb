class Boat < ApplicationRecord
    belongs_to :user
    has_many :jobs, :through => :assignments
    has_many :assignments
    
    validates :name, uniqueness: true, presence: true
    validates :location, presence: true
    validates :ccc, numericality: { :greater_than => 0, :less_than_or_equal_to => 9999}
    
    def self.search(search)
        where("name LIKE ?", "%#{search}%")
    end
end
