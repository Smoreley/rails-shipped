class Job < ApplicationRecord
    has_many :boats, :through => :assignments
    has_many :assignments

    validates(:name, uniqueness: true, presence: true, length: {minimum: 3})
    validates :origin, :destination, presence: true
    validates :description, presence: true, length: {minimum: 50}
    validates :cost, numericality: { :greater_than => 1000, :less_than_or_equal_to => 999999999}
    validates :cc, numericality: { :greater_than => 0, :less_than_or_equal_to => 99999}
    
    
    def self.search(search)
        where("name LIKE ?", "%#{search}%")
    end
    
    def assign(boat)
       assignments.create(boat_id: boat.id)
    end
    
    def unassign(boat)
       assignments.find_by(boat_id: boat.id).destroy 
    end
    
    def assigned(boat)
       assignments.include?(boat) 
    end
end
