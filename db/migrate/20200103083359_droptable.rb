class Droptable < ActiveRecord::Migration[5.2]
  def change
    drop_join_table :projects, :users 
  end
end
