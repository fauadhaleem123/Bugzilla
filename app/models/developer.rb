class Developer < User
    has_and_belongs_to_many :projects, join_table: "developers_projects"
    has_many :bugs
end
