class Qa < User
    has_and_belongs_to_many :projects, join_table: "projects_qas"
    has_many :bugs
end
 