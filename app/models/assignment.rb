class Assignment < ApplicationRecord
    belongs_to :boat, class_name: "Boat"
    belongs_to :job, class_name: "Job"
    validates :boat_id, presence: true
    validates :job_id, presence: true
end
