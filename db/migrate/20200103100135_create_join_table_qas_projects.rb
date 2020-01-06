class CreateJoinTableQasProjects < ActiveRecord::Migration[5.2]
  def change
    create_join_table :qas, :projects do |t|
      # t.index [:qa_id, :project_id]
      # t.index [:project_id, :qa_id]
    end
  end
end
