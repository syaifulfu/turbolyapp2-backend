class Task < ApplicationRecord

    validates :name, presence: true
    validates :due_date, presence: true
    validates :priority, presence: true, numericality: {
        greater_than_or_equal_to: 1
    }

end
