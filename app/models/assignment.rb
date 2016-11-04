class Assignment < ApplicationRecord
    belongs_to :boat
    belongs_to :job
    
    validates :boat_id, presence: true
    validates :job_id, presence: true
end
