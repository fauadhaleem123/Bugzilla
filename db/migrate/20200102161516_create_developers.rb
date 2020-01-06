class CreateDevelopers < ActiveRecord::Migration[5.2]
  def change
    create_table :developers do |t|

      t.timestamps
    end
  end
end
