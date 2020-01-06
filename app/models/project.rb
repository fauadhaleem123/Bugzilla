class Project < ApplicationRecord
    has_many :bugs, dependent: :delete_all
    has_and_belongs_to_many :qas, join_table: "projects_qas"
    has_and_belongs_to_many :developers, join_table: "developers_projects"
    belongs_to :manager


    validates :title, presence: true,
                    length: {minimum: 5}
end
 