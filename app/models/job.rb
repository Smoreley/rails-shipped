class Job < ApplicationRecord
    validates(:name, uniqueness: true, presence: true, length: {minimum: 3})
    validates :origin, :destination, presence: true
    validates :description, presence: true, length: {minimum: 50}
    validates :cost, numericality: { :greater_than => 1000}
    validates :cc, numericality: { :greater_than => 0}
end
