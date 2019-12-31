class AddBugIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :bug_id, :integer
  end
end
