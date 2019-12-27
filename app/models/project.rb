class Project < ApplicationRecord
    has_many :bugs
    belongs_to :user
    validates :title, presence: true,
                    length: {minimum: 5}
end
