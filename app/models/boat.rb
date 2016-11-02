class Boat < ApplicationRecord
    validates :name, uniqueness: true, presence: true
    validates :location, presence: true
    validates :ccc, numericality: { :greater_than => 0}
    
    has_many :active_relationships, class_name: "Assignments", foreign_key: "boat_id", dependent: :destroy
    
end
